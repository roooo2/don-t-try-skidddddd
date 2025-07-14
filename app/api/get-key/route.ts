import { NextResponse } from "next/server"
import { createClient } from "@supabase/supabase-js"

// Initialize Supabase client
const supabaseUrl = process.env.SUPABASE_URL!
const supabaseAnonKey = process.env.SUPABASE_ANON_KEY!
const supabase = createClient(supabaseUrl, supabaseAnonKey)

export async function GET(request: Request) {
  const { searchParams } = new URL(request.url)
  const userId = searchParams.get("userId")

  if (!userId) {
    return NextResponse.json({ error: "User ID is required" }, { status: 400 })
  }

  const now = Date.now()
  const TWELVE_HOURS_IN_MS = 12 * 60 * 60 * 1000 // 12 hours for key validity

  try {
    // Try to fetch existing key for the user
    const { data: existingKeyData, error: fetchError } = await supabase
      .from("user_keys")
      .select("*")
      .eq("user_id", userId)
      .single()

    /**
     * PGRST116  – “No rows found”
     * 42P01     – Postgres: undefined_table  ➜  relation "public.user_keys" does not exist
     */
    if (fetchError && fetchError.code !== "PGRST116") {
      // If the table itself hasn't been created, surface a clear message
      if (fetchError.message?.toLowerCase().includes("does not exist") || fetchError.code === "42P01") {
        console.error("Supabase fetch error – the `user_keys` table is missing:", fetchError)
        return NextResponse.json(
          {
            error:
              "Server mis-configuration: `user_keys` table is missing. " +
              "An admin must run the migration to create it before keys can be generated.",
          },
          { status: 500 },
        )
      }

      console.error("Supabase fetch error:", fetchError)
      return NextResponse.json({ error: "Database error fetching key." }, { status: 500 })
    }

    if (existingKeyData) {
      const expiresAtTimestamp = new Date(existingKeyData.expires_at).getTime()

      if (now < expiresAtTimestamp) {
        // Key exists and is still valid
        console.log(`Returning existing valid key for user ${userId}: ${existingKeyData.key_value}`)
        return NextResponse.json({
          key: existingKeyData.key_value,
          expiresAt: existingKeyData.expires_at,
        })
      }
    }

    // Key does not exist or is expired, generate a new one
    const newKey = `DevilUgly${Math.random().toString(36).substring(2, 10)}`
    const generatedAt = new Date(now).toISOString()
    const expiresAt = new Date(now + TWELVE_HOURS_IN_MS).toISOString()

    const { error: upsertError } = await supabase.from("user_keys").upsert(
      { user_id: userId, key_value: newKey, generated_at: generatedAt, expires_at: expiresAt },
      { onConflict: "user_id" }, // Update if user_id already exists
    )

    if (upsertError) {
      console.error("Supabase upsert error:", upsertError)
      return NextResponse.json({ error: "Database error generating new key." }, { status: 500 })
    }

    console.log(`Generated new key for user ${userId}: ${newKey}`)
    return NextResponse.json({ key: newKey, expiresAt: expiresAt })
  } catch (err) {
    console.error("Unexpected server error:", err)
    return NextResponse.json({ error: "An unexpected server error occurred." }, { status: 500 })
  }
}
