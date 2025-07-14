"use client"

import { useState, useEffect, useCallback } from "react"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardDescription, CardHeader, CardTitle, CardFooter } from "@/components/ui/card"
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogHeader,
  DialogTitle,
  DialogTrigger,
} from "@/components/ui/dialog"
import { Input } from "@/components/ui/input"
import { Progress } from "@/components/ui/progress" // Assuming shadcn/ui progress component is available
import { useToast } from "@/hooks/use-toast" // Assuming shadcn/ui toast hook is available

// Define your Work.ink checkpoint URLs here
// IMPORTANT: For each Work.ink link, set its "Destination URL" in Work.ink's dashboard
// to your main website URL: https://devilugly.vercel.app/ (or your custom domain)
const CHECKPOINTS = [
  {
    name: "Checkpoint 1",
    linkvertiseUrl: "https://workink.net/21E0/jo99i9wh",
  },
  {
    name: "Checkpoint 2",
    linkvertiseUrl: "https://workink.net/21E0/w4wybpxc",
  },
]

const USER_ID_STORAGE_KEY = "roblox_user_id"
const CHECKPOINT_INDEX_STORAGE_KEY = "current_checkpoint_index"
const LAST_CHECKPOINT_CLICK_TIME_KEY = "last_checkpoint_click_time"
const MIN_CHECKPOINT_TIME_MS = 9000 // 9 seconds

const DISCORD_LINK = "https://discord.gg/mKkqVnXvMR"

export default function KeyPage() {
  const [key, setKey] = useState<string | null>(null)
  const [expiresAt, setExpiresAt] = useState<string | null>(null)
  const [timeRemaining, setTimeRemaining] = useState<string | null>(null)
  const [loading, setLoading] = useState<boolean>(false)
  const [error, setError] = useState<string | null>(null)
  const [userIdInput, setUserIdInput] = useState<string>("")
  const [currentCheckpointIndex, setCurrentCheckpointIndex] = useState<number>(0) // 0-indexed
  const totalCheckpoints = CHECKPOINTS.length
  const { toast } = useToast()

  const formatTime = (ms: number) => {
    if (ms <= 0) return "Expired"
    const totalSeconds = Math.floor(ms / 1000)
    const hours = Math.floor(totalSeconds / 3600)
    const minutes = Math.floor((totalSeconds % 3600) / 60)
    const seconds = totalSeconds % 60
    return `${String(hours).padStart(2, "0")}:${String(minutes).padStart(2, "0")}:${String(seconds).padStart(2, "0")}`
  }

  const calculateTimeRemaining = useCallback(() => {
    if (expiresAt) {
      const now = Date.now()
      const expiryTime = new Date(expiresAt).getTime()
      const remainingMs = expiryTime - now
      setTimeRemaining(formatTime(remainingMs))
    } else {
      setTimeRemaining(null)
    }
  }, [expiresAt])

  const fetchKey = async (id: string) => {
    // Validate that the input is purely numeric before sending to backend
    if (!id || !/^\d+$/.test(id)) {
      setError("Please enter a valid Roblox User ID (numbers only).")
      return
    }

    setLoading(true)
    setError(null)
    setKey(null)
    setExpiresAt(null)
    setTimeRemaining(null)

    try {
      const websiteBaseUrl = process.env.NEXT_PUBLIC_WEBSITE_BASE_URL ?? ""
      const apiUrl = `${
        websiteBaseUrl ? websiteBaseUrl.replace(/\/$/, "") : ""
      }/api/get-key?userId=${encodeURIComponent(id)}`

      const response = await fetch(apiUrl, { method: "GET" })
      const data = await response.json()

      if (response.ok) {
        setKey(data.key)
        setExpiresAt(data.expiresAt)
        // Clear checkpoint progress and user ID from storage after key is generated
        localStorage.removeItem(USER_ID_STORAGE_KEY)
        localStorage.removeItem(CHECKPOINT_INDEX_STORAGE_KEY)
        localStorage.removeItem(LAST_CHECKPOINT_CLICK_TIME_KEY)
        setCurrentCheckpointIndex(totalCheckpoints) // Ensure UI updates to show key
      } else {
        setError(data.error || "Failed to fetch key.")
      }
    } catch (err) {
      setError("Network error or server is down.")
      console.error(err)
    } finally {
      setLoading(false)
    }
  }

  // Load state from localStorage on initial mount
  useEffect(() => {
    const storedUserId = localStorage.getItem(USER_ID_STORAGE_KEY)
    const storedCheckpointIndex = localStorage.getItem(CHECKPOINT_INDEX_STORAGE_KEY)
    const storedLastClickTime = localStorage.getItem(LAST_CHECKPOINT_CLICK_TIME_KEY)

    let initialCheckpointIndex = 0
    if (storedCheckpointIndex !== null) {
      initialCheckpointIndex = Number.parseInt(storedCheckpointIndex, 10)
    }

    // 9-second check: If user advanced a checkpoint but returned too quickly
    if (initialCheckpointIndex > 0 && storedLastClickTime) {
      const lastClickTimestamp = Number.parseInt(storedLastClickTime, 10)
      const timeElapsed = Date.now() - lastClickTimestamp

      if (timeElapsed < MIN_CHECKPOINT_TIME_MS) {
        setError("You didn't complete the checkpoint. Please try again.")
        // Revert to the previous checkpoint to force re-completion
        initialCheckpointIndex = Math.max(0, initialCheckpointIndex - 1)
        localStorage.setItem(CHECKPOINT_INDEX_STORAGE_KEY, initialCheckpointIndex.toString())
        localStorage.removeItem(LAST_CHECKPOINT_CLICK_TIME_KEY) // Clear timestamp
      } else {
        setError(null) // Clear any previous error if time passed
      }
    }

    setCurrentCheckpointIndex(initialCheckpointIndex)

    if (storedUserId) {
      setUserIdInput(storedUserId)
      // If all checkpoints are done AND user ID is present, try to fetch key
      if (initialCheckpointIndex === totalCheckpoints) {
        fetchKey(storedUserId)
      }
    }

    // Handle URL parameter for initial user ID (e.g., from a direct link)
    const urlParams = new URLSearchParams(window.location.search)
    const paramUserId = urlParams.get("userId")
    if (paramUserId && !storedUserId) {
      // Only set from URL if not already in storage
      setUserIdInput(paramUserId)
      localStorage.setItem(USER_ID_STORAGE_KEY, paramUserId)
    }
  }, []) // Run once on mount

  // Save userId and currentCheckpointIndex to localStorage whenever they change
  useEffect(() => {
    if (userIdInput) {
      localStorage.setItem(USER_ID_STORAGE_KEY, userIdInput)
    }
  }, [userIdInput])

  useEffect(() => {
    localStorage.setItem(CHECKPOINT_INDEX_STORAGE_KEY, currentCheckpointIndex.toString())
  }, [currentCheckpointIndex])

  // Update time remaining every second
  useEffect(() => {
    let interval: NodeJS.Timeout | null = null
    if (expiresAt) {
      calculateTimeRemaining() // Initial calculation
      interval = setInterval(calculateTimeRemaining, 1000) // Update every second
    } else if (interval) {
      clearInterval(interval)
    }
    return () => {
      if (interval) clearInterval(interval)
    }
  }, [expiresAt, calculateTimeRemaining])

  const handleGoToCheckpoint = () => {
    // Validate that the input is purely numeric before proceeding
    if (!userIdInput || !/^\d+$/.test(userIdInput)) {
      setError("Please enter a valid Roblox User ID (numbers only).")
      return
    }
    setError(null)

    const checkpoint = CHECKPOINTS[currentCheckpointIndex]
    if (checkpoint) {
      // Store timestamp before redirecting
      localStorage.setItem(LAST_CHECKPOINT_CLICK_TIME_KEY, Date.now().toString())
      // Increment checkpoint index immediately before redirecting
      setCurrentCheckpointIndex((prev) => prev + 1)
      window.location.href = checkpoint.linkvertiseUrl
    }
  }

  const handleCopyDiscordLink = () => {
    navigator.clipboard
      .writeText(DISCORD_LINK)
      .then(() => {
        toast({
          title: "Discord Link Copied!",
          description: DISCORD_LINK,
        })
      })
      .catch((err) => {
        console.error("Failed to copy Discord link:", err)
        toast({
          title: "Failed to copy link",
          description: "Please copy manually: " + DISCORD_LINK,
          variant: "destructive",
        })
      })
  }

  const progressValue = (currentCheckpointIndex / totalCheckpoints) * 100

  return (
    <div className="flex min-h-screen items-center justify-center bg-gray-950 p-4 relative">
      {/* Credits Dialog and Trigger outside the main card */}
      <div className="absolute top-4 right-4 z-10">
        <Dialog>
          <DialogTrigger asChild>
            <Button variant="ghost" className="text-gray-400 hover:text-red-500">
              Credits
            </Button>
          </DialogTrigger>
          <DialogContent className="sm:max-w-[425px] bg-gradient-to-br from-gray-900 to-black text-white border-red-700 shadow-2xl rounded-lg">
            <DialogHeader className="pb-4 border-b border-red-800">
              <DialogTitle className="text-red-500 text-3xl font-extrabold text-center">Credits</DialogTitle>
              <DialogDescription className="text-gray-400 text-center text-sm mt-2">
                Information about the creators and contributors to this key system.
              </DialogDescription>
            </DialogHeader>
            <div className="grid gap-6 py-6">
              <div className="flex flex-col sm:flex-row sm:items-center sm:gap-4 p-3 rounded-md bg-gray-800/50 hover:bg-gray-700/50 transition-all duration-300 ease-in-out group">
                <span className="font-bold text-gray-300 w-24 shrink-0 group-hover:text-red-400 transition-colors">
                  Owner:
                </span>
                <span className="text-gray-200 group-hover:text-white transition-colors">armin698672</span>
              </div>
              <div className="flex flex-col sm:flex-row sm:items-center sm:gap-4 p-3 rounded-md bg-gray-800/50 hover:bg-gray-700/50 transition-all duration-300 ease-in-out group">
                <span className="font-bold text-gray-300 w-24 shrink-0 group-hover:text-red-400 transition-colors">
                  Developer:
                </span>
                <span className="text-gray-200 group-hover:text-white transition-colors">armin698672</span>
              </div>
              <div className="flex flex-col sm:flex-row sm:items-center sm:gap-4 p-3 rounded-md bg-gray-800/50 hover:bg-gray-700/50 transition-all duration-300 ease-in-out group">
                <span className="font-bold text-gray-300 w-24 shrink-0 group-hover:text-red-400 transition-colors">
                  Designer:
                </span>
                <span className="text-gray-200 group-hover:text-white transition-colors">elmejorsiuuu</span>
              </div>
            </div>
          </DialogContent>
        </Dialog>
      </div>

      <Card className="w-full max-w-md bg-gray-900 text-white border-red-700 shadow-lg">
        <CardHeader className="text-center">
          <CardTitle className="text-3xl font-bold text-red-500">👹 Devil Ugly's Key System</CardTitle>
          <CardDescription className="text-gray-400">Your unique access key for the Roblox script.</CardDescription>
        </CardHeader>
        <CardContent className="space-y-6">
          <div className="space-y-2">
            <label htmlFor="userId" className="block text-sm font-medium text-gray-300">
              Your Roblox User ID
            </label>
            <Input
              id="userId"
              type="number" // Changed to number type
              placeholder="Enter your Roblox User ID" // Updated placeholder
              value={userIdInput}
              onChange={(e) => setUserIdInput(e.target.value)}
              className="bg-gray-800 border-gray-700 text-white focus:border-red-500 focus:ring-red-500"
              // Input is disabled only if loading or if a key has been obtained
              disabled={loading || key !== null}
            />
          </div>

          {currentCheckpointIndex < totalCheckpoints ? (
            <div className="space-y-4">
              <p className="text-center text-lg font-semibold text-gray-300">Complete Checkpoints to get your Key:</p>
              <Progress value={progressValue} className="w-full h-2 bg-gray-700 [&>*]:bg-red-500" />
              <p className="text-center text-sm text-gray-400">
                Progress: {currentCheckpointIndex} / {totalCheckpoints}
              </p>
              <Button
                onClick={handleGoToCheckpoint}
                disabled={!userIdInput || loading || key !== null} // Disable if no User ID or loading or key obtained
                className="w-full bg-red-700 hover:bg-red-800 text-white font-bold py-2 px-4 rounded-md transition-colors duration-200"
              >
                Go to {CHECKPOINTS[currentCheckpointIndex]?.name}
              </Button>
              <p className="text-center text-sm text-gray-500">
                After completing the offer, you will be redirected back here.
              </p>
            </div>
          ) : (
            <>
              <Button
                onClick={() => fetchKey(userIdInput)}
                disabled={loading || !userIdInput || key !== null}
                className="w-full bg-red-700 hover:bg-red-800 text-white font-bold py-2 px-4 rounded-md transition-colors duration-200"
              >
                {loading ? "Generating Key..." : "Get My Key"}
              </Button>

              {key && (
                <div className="mt-4 text-center">
                  <p className="text-lg font-semibold text-gray-300">Your Key:</p>
                  <p className="text-2xl font-extrabold text-green-400 break-all bg-gray-800 p-3 rounded-md border border-green-600">
                    {key}
                  </p>
                  {timeRemaining && (
                    <p className="text-sm text-gray-500 mt-2">
                      Time remaining: <span className="font-semibold text-yellow-400">{timeRemaining}</span>
                    </p>
                  )}
                  <p className="text-sm text-gray-500 mt-2">
                    This key is valid for 12 hours. You will need to re-obtain a new key after it expires.
                  </p>
                </div>
              )}
            </>
          )}

          {error && (
            <div className="mt-4 text-center text-red-400">
              <p>{error}</p>
            </div>
          )}
        </CardContent>
        <CardFooter className="flex flex-col items-center gap-2 pt-4 border-t border-gray-800">
          <p className="text-sm text-gray-400">Need help? Join our Discord server!</p>
          <Button
            onClick={handleCopyDiscordLink}
            className="w-full bg-red-700 hover:bg-red-800 text-white font-bold py-2 px-4 rounded-md transition-colors duration-200"
          >
            Join Discord Server
          </Button>
        </CardFooter>
      </Card>
    </div>
  )
}
