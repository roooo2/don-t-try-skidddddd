local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Ensure the RemoteFunction exists
local GetKeyFunction = ReplicatedStorage:FindFirstChild("GetKeyFunction")
if not GetKeyFunction then
    GetKeyFunction = Instance.new("RemoteFunction")
    GetKeyFunction.Name = "GetKeyFunction"
    GetKeyFunction.Parent = ReplicatedStorage
    print("Created RemoteFunction 'GetKeyFunction' in ReplicatedStorage.")
else
    print("Found existing RemoteFunction 'GetKeyFunction' in ReplicatedStorage.")
end

-- IMPORTANT: Ensure this URL matches your deployed website's URL
local WEBSITE_BASE_URL = "https://devilugly.vercel.app"

GetKeyFunction.OnServerInvoke = function(player, userId)
    if not userId or type(userId) ~= "number" then
        warn("Invalid userId received from client:", userId)
        return {error = "Invalid User ID provided."}
    end

    local success, response = pcall(function()
        local apiUrl = WEBSITE_BASE_URL .. "/api/get-key?userId=" .. userId
        return HttpService:GetAsync(apiUrl)
    end)

    if success then
        local decodedResponse = HttpService:JSONDecode(response)
        if decodedResponse and decodedResponse.key then
            print(string.format("Server fetched key for user %d: %s", userId, decodedResponse.key))
            return decodedResponse -- Returns {key = "...", expiresAt = "..."}
        else
            warn(string.format("Server failed to decode key response for user %d: %s", userId, response))
            return {error = decodedResponse.error or "Failed to get key from server."}
        end
    else
        warn(string.format("Server HTTP request failed for user %d: %s", userId, response))
        return {error = "Could not connect to key server."}
    end
end

print("ServerKeyFetcher loaded and ready.")
