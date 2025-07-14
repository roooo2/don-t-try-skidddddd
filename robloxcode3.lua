local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer
local CORRECT_KEY = ""
local keyEntered = false
local keyGui = Instance.new("ScreenGui")
keyGui.Name = "DevilUglyKeySystem"
keyGui.Parent = game.CoreGui
keyGui.ResetOnSpawn = false
local blurFrame = Instance.new("Frame")
blurFrame.Name = "BlurBackground"
blurFrame.Parent = keyGui
blurFrame.Size = UDim2.new(1, 0, 1, 0)
blurFrame.Position = UDim2.new(0, 0, 0, 0)
blurFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
blurFrame.BackgroundTransparency = 0.3
blurFrame.BorderSizePixel = 0
blurFrame.ZIndex = 1
local blur = Instance.new("BlurEffect")
blur.Parent = game.Lighting
blur.Size = 24
local keyFrame = Instance.new("Frame")
keyFrame.Name = "KeyFrame"
keyFrame.Parent = keyGui
keyFrame.Size = UDim2.new(0, 400, 0, 300)
keyFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
keyFrame.BackgroundColor3 = Color3.fromRGB(8, 8, 8)
keyFrame.BorderSizePixel = 0
keyFrame.ZIndex = 2
local keyCorner = Instance.new("UICorner")
keyCorner.CornerRadius = UDim.new(0, 20)
keyCorner.Parent = keyFrame
local keyStroke = Instance.new("UIStroke")
keyStroke.Color = Color3.fromRGB(220, 20, 20)
keyStroke.Thickness = 3
keyStroke.Transparency = 0.2
keyStroke.Parent = keyFrame
local keyGlowFrame = Instance.new("Frame")
keyGlowFrame.Name = "KeyGlowFrame"
keyGlowFrame.Parent = keyFrame
keyGlowFrame.Size = UDim2.new(1, 40, 1, 40)
keyGlowFrame.Position = UDim2.new(0, -20, 0, -20)
keyGlowFrame.BackgroundTransparency = 1
keyGlowFrame.ZIndex = 1
local keyGlow = Instance.new("ImageLabel")
keyGlow.Parent = keyGlowFrame
keyGlow.Size = UDim2.new(1, 0, 1, 0)
keyGlow.Position = UDim2.new(0, 0, 0, 0)
keyGlow.BackgroundTransparency = 1
keyGlow.Image = "rbxassetid://1316045217"
keyGlow.ImageColor3 = Color3.fromRGB(220, 20, 20)
keyGlow.ImageTransparency = 0.6
keyGlow.ZIndex = 1
local keyGlowCorner = Instance.new("UICorner")
keyGlowCorner.CornerRadius = UDim.new(0, 20)
keyGlowCorner.Parent = keyGlow
local keyGlowTween = TweenService:Create(keyGlow, TweenInfo.new(2.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
    ImageTransparency = 0.2,
    Size = UDim2.new(1.2, 0, 1.2, 0),
    Position = UDim2.new(-0.1, 0, -0.1, 0)})
keyGlowTween:Play()
local keyStrokeTween = TweenService:Create(keyStroke, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
    Transparency = 0.7})
keyStrokeTween:Play()
local devilLogo = Instance.new("ImageLabel")
devilLogo.Name = "DevilLogo"
devilLogo.Parent = keyFrame
devilLogo.Size = UDim2.new(0, 80, 0, 80)
devilLogo.Position = UDim2.new(0.5, -40, 0, 20)
devilLogo.BackgroundTransparency = 1
devilLogo.Image = "rbxassetid://124798122018640"
devilLogo.ImageColor3 = Color3.fromRGB(220, 20, 20)
devilLogo.ZIndex = 3
local logoCorner = Instance.new("UICorner")
logoCorner.CornerRadius = UDim.new(0.5, 0)
logoCorner.Parent = devilLogo
local logoGlow = Instance.new("UIStroke")
logoGlow.Parent = devilLogo
logoGlow.Color = Color3.fromRGB(255, 50, 50)
logoGlow.Thickness = 3
logoGlow.Transparency = 0.4
local logoGlowTween = TweenService:Create(logoGlow, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
    Transparency = 0.8,
    Thickness = 5})
logoGlowTween:Play()
local keyTitle = Instance.new("TextLabel")
keyTitle.Name = "KeyTitle"
keyTitle.Parent = keyFrame
keyTitle.Size = UDim2.new(1, 0, 0, 40)
keyTitle.Position = UDim2.new(0, 0, 0, 110)
keyTitle.BackgroundTransparency = 1
keyTitle.Text = "👹 DEVIL UGLY'S KEY SYSTEM"
keyTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
keyTitle.Font = Enum.Font.GothamBold
keyTitle.TextSize = 24
keyTitle.ZIndex = 3
local titleStroke = Instance.new("UIStroke")
titleStroke.Parent = keyTitle
titleStroke.Color = Color3.fromRGB(220, 20, 20)
titleStroke.Thickness = 2
titleStroke.Transparency = 0.3
local keySubtitle = Instance.new("TextLabel")
keySubtitle.Name = "KeySubtitle"
keySubtitle.Parent = keyFrame
keySubtitle.Size = UDim2.new(1, 0, 0, 25)
keySubtitle.Position = UDim2.new(0, 0, 0, 150)
keySubtitle.BackgroundTransparency = 1
keySubtitle.Text = "Enter the access key to continue"
keySubtitle.TextColor3 = Color3.fromRGB(200, 200, 200)
keySubtitle.Font = Enum.Font.Gotham
keySubtitle.TextSize = 16
keySubtitle.ZIndex = 3
local keyInput = Instance.new("TextBox")
keyInput.Name = "KeyInput"
keyInput.Parent = keyFrame
keyInput.Size = UDim2.new(0, 300, 0, 45)
keyInput.Position = UDim2.new(0.5, -150, 0, 185)
keyInput.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
keyInput.Text = ""
keyInput.PlaceholderText = "Enter Key Here..."
keyInput.PlaceholderColor3 = Color3.fromRGB(100, 100, 100)
keyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
keyInput.Font = Enum.Font.Gotham
keyInput.TextSize = 16
keyInput.BorderSizePixel = 0
keyInput.ZIndex = 3
local inputCorner = Instance.new("UICorner")
inputCorner.CornerRadius = UDim.new(0, 12)
inputCorner.Parent = keyInput
local inputStroke = Instance.new("UIStroke")
inputStroke.Color = Color3.fromRGB(220, 20, 20)
inputStroke.Thickness = 2
inputStroke.Transparency = 0.6
inputStroke.Parent = keyInput
keyInput.Focused:Connect(function()
    local focusTween = TweenService:Create(inputStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
        Transparency = 0.2,
        Thickness = 3
    })
    focusTween:Play()
    local bgTween = TweenService:Create(keyInput, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
        BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    })
    bgTween:Play()
end)
keyInput.FocusLost:Connect(function()
    local unfocusTween = TweenService:Create(inputStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
        Transparency = 0.6,
        Thickness = 2
    })
    unfocusTween:Play()
    local bgTween = TweenService:Create(keyInput, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
        BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    })
    bgTween:Play()
end)
local submitBtn = Instance.new("TextButton")
submitBtn.Name = "SubmitButton"
submitBtn.Parent = keyFrame
submitBtn.Size = UDim2.new(0, 140, 0, 40)
submitBtn.Position = UDim2.new(0.5, -70, 0, 245)
submitBtn.BackgroundColor3 = Color3.fromRGB(220, 20, 20)
submitBtn.Text = "🔑 SUBMIT KEY"
submitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
submitBtn.Font = Enum.Font.GothamBold
submitBtn.TextSize = 14
submitBtn.BorderSizePixel = 0
submitBtn.ZIndex = 3
local submitCorner = Instance.new("UICorner")
submitCorner.CornerRadius = UDim.new(0, 12)
submitCorner.Parent = submitBtn
local submitStroke = Instance.new("UIStroke")
submitStroke.Color = Color3.fromRGB(255, 50, 50)
submitStroke.Thickness = 2
submitStroke.Transparency = 0.4
submitStroke.Parent = submitBtn
submitBtn.MouseEnter:Connect(function()
    local hoverTween = TweenService:Create(submitBtn, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
        BackgroundColor3 = Color3.fromRGB(255, 30, 30),
        Size = UDim2.new(0, 145, 0, 42)
    })
    hoverTween:Play()
    local strokeTween = TweenService:Create(submitStroke, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
        Transparency = 0.1,
        Thickness = 3
    })
    strokeTween:Play()
end)
submitBtn.MouseLeave:Connect(function()
    local leaveTween = TweenService:Create(submitBtn, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
        BackgroundColor3 = Color3.fromRGB(220, 20, 20),
        Size = UDim2.new(0, 140, 0, 40)
    })
    leaveTween:Play()
    local strokeTween = TweenService:Create(submitStroke, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
        Transparency = 0.4,
        Thickness = 2
    })
    strokeTween:Play()
end)
local statusLabel = Instance.new("TextLabel")
statusLabel.Name = "StatusLabel"
statusLabel.Parent = keyFrame
statusLabel.Size = UDim2.new(1, 0, 0, 20)
statusLabel.Position = UDim2.new(0, 0, 1, -25)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = ""
statusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextSize = 12
statusLabel.ZIndex = 3

-- Discord Button and Text
local DISCORD_LINK = "https://discord.gg/mKkqVnXvMR"

local discordText = Instance.new("TextLabel")
discordText.Name = "DiscordText"
discordText.Parent = keyFrame
discordText.Size = UDim2.new(1, 0, 0, 20)
discordText.Position = UDim2.new(0, 0, 0, 285) -- Position below submit button
discordText.BackgroundTransparency = 1
discordText.Text = "Need a key? Join the Discord server!"
discordText.TextColor3 = Color3.fromRGB(200, 200, 200)
discordText.Font = Enum.Font.Gotham
discordText.TextSize = 12
discordText.ZIndex = 3

local discordBtn = Instance.new("TextButton")
discordBtn.Name = "DiscordButton"
discordBtn.Parent = keyFrame
discordBtn.Size = UDim2.new(0, 180, 0, 35)
discordBtn.Position = UDim2.new(0.5, -90, 0, 310) -- Position below text
discordBtn.BackgroundColor3 = Color3.fromRGB(220, 20, 20) -- Red color
discordBtn.Text = "Discord Server"
discordBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
discordBtn.Font = Enum.Font.GothamBold
discordBtn.TextSize = 14
discordBtn.BorderSizePixel = 0
discordBtn.ZIndex = 3
local discordBtnCorner = Instance.new("UICorner")
discordBtnCorner.CornerRadius = UDim.new(0, 12)
discordBtnCorner.Parent = discordBtn
local discordBtnStroke = Instance.new("UIStroke")
discordBtnStroke.Color = Color3.fromRGB(255, 50, 50)
discordBtnStroke.Thickness = 2
discordBtnStroke.Transparency = 0.4
discordBtnStroke.Parent = discordBtn

discordBtn.MouseEnter:Connect(function()
    local hoverTween = TweenService:Create(discordBtn, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
        BackgroundColor3 = Color3.fromRGB(255, 30, 30),
        Size = UDim2.new(0, 185, 0, 37)
    })
    hoverTween:Play()
    local strokeTween = TweenService:Create(discordBtnStroke, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
        Transparency = 0.1,
        Thickness = 3
    })
    strokeTween:Play()
end)
discordBtn.MouseLeave:Connect(function()
    local leaveTween = TweenService:Create(discordBtn, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
        BackgroundColor3 = Color3.fromRGB(220, 20, 20),
        Size = UDim2.new(0, 180, 0, 35)
    })
    leaveTween:Play()
    local strokeTween = TweenService:Create(discordBtnStroke, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
        Transparency = 0.4,
        Thickness = 2
    })
    strokeTween:Play()
end)

discordBtn.MouseButton1Click:Connect(function()
    local success, err = pcall(function()
        game:GetService("UserInputService"):SetClipboard(DISCORD_LINK)
    end)
    if success then
        statusLabel.Text = "✅ Discord server link copied!"
        statusLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
        task.wait(3)
        statusLabel.Text = "" -- Clear message after a few seconds
    else
        statusLabel.Text = "❌ Failed to copy link."
        statusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
        warn("Failed to copy Discord link:", err)
        task.wait(3)
        statusLabel.Text = ""
    end
end)


local function fetchCorrectKey()
    local success, response = pcall(function()
        -- IMPORTANT: REPLACE THIS URL WITH YOUR DEPLOYED WEBSITE'S URL
        local websiteUrl = "https://v0-roblox-lua-script-coral.vercel.app/api/get-key?userId=" .. player.UserId
        return HttpService:GetAsync(websiteUrl)
    end)

    if success then
        local decodedResponse = HttpService:JSONDecode(response)
        if decodedResponse and decodedResponse.key then
            CORRECT_KEY = decodedResponse.key
            print("Fetched correct key:", CORRECT_KEY)
            return true
        else
            warn("Failed to decode key response or key not found:", response)
            statusLabel.Text = "❌ Failed to get key from server."
            statusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
            return false
        end
    else
        warn("HTTP request failed:", response)
        statusLabel.Text = "❌ Could not connect to key server."
        statusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
        return false
    end
end

local function validateKey()
    local enteredKey = keyInput.Text
    if enteredKey == CORRECT_KEY then
        statusLabel.Text = "✅ ACCESS GRANTED! Loading..."
        statusLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
        local successTween = TweenService:Create(keyFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 0, 0, 0),
            Position = UDim2.new(0.5, 0, 0.5, 0),
            Rotation = 360
        })
        successTween:Play()
        local fadeTween = TweenService:Create(blurFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
            BackgroundTransparency = 1
        })
        fadeTween:Play()
        successTween.Completed:Connect(function()
            keyEntered = true
            blur:Destroy()
            keyGui:Destroy()
            loadMainScript()
        end)
    else
        statusLabel.Text = "❌ INVALID KEY! Try again..."
        statusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
        local originalPos = keyFrame.Position
        for i = 1, 6 do
            local shakeOffset = i % 2 == 0 and 10 or -10
            TweenService:Create(keyFrame, TweenInfo.new(0.05, Enum.EasingStyle.Quad), {
                Position = UDim2.new(originalPos.X.Scale, originalPos.X.Offset + shakeOffset, originalPos.Y.Scale, originalPos.Y.Offset)
            }):Play()
            wait(0.05)
        end
        TweenService:Create(keyFrame, TweenInfo.new(0.1, Enum.EasingStyle.Quad), {
            Position = originalPos
        }):Play()
        keyInput.Text = ""
    end
end
submitBtn.MouseButton1Click:Connect(validateKey)
keyInput.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        validateKey()
    end
end)
keyFrame.Size = UDim2.new(0, 0, 0, 0)
keyFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
keyFrame.Rotation = -180
wait(0.2)
local entranceTween = TweenService:Create(keyFrame, TweenInfo.new(0.8, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 400, 0, 300),
    Position = UDim2.new(0.5, -200, 0.5, -150),
    Rotation = 0})
entranceTween:Play()
function loadMainScript()
    wait(1)
    local PLOTS = workspace:WaitForChild("Plots")
    local UPDATE_INTERVAL = 0.25
    local AutoHopEnabled = false
    local showESP = false
    local autoFarmEnabled = false
    local selectedPet = "Noobini Pizzanini"
    local selectedFarmMode = "Tween"
    local WEBHOOKS = {
        Secret = "https://discord.com/api/webhooks/1322569660109033543/VWNlBJ_DoJtO2iuRKk0ke-I7dcbEqr7oeEHlaYqJdHVvEc33gp7iRnrCYdqQxy_lxUpa",
        ["Brainrot God"] = "https://discord.com/api/webhooks/1391010861216170034/8kas5liMnaj6EjJ8sa5IR9viAl7pWIGMRjmBbYEQwqw4ZNSSoANOZSQF-2TUYSqBaslH"
    }
    local BASE_PET_TIERS = {
        ["Brainrot God"] = {
            "Cocofanto Elefanto", "Nyan Cat", "Girafa Celeste",
            "Tralalero Tralala", "Matteo", "Odin Din Din Dun",
            "Trenostruzzo Turbo 3000"
        },
        Secret = {
            "La Vacca Saturno Saturnita", "Los Tralaleritos",
            "Graipuss Medussi", "La Grande Combinasion"
        }
    }
    local EMOJIS = {
        ["Brainrot God"] = "👹",
        Secret = "🔑"
    }
    local MUTATION_EMOJIS = {
        Rainbow = "🌈",
        Gold = "🟡",
        Diamond = "💎",
        Bloodlit = "🩸"
    }
    local request_func = syn and syn.request or http_request
    local PetToTier = {}
    for tier, petList in pairs(BASE_PET_TIERS) do
        for _, pet in ipairs(petList) do
            PetToTier[pet] = tier
        end
    end
    local Brainrots = {
        "Noobini Pizzanini","Lirilì Larilà","Tim Cheese","Fluriflura","Talpa Di Fero",
        "Svinina Bombardino","Pipi Kiwi","Trippi Troppi","Tung Tung Tung Sahur","Gangster Footera",
        "Bandito Bobritto","Boneca Ambalabu","Ta Ta Ta Ta Sahur","Tric Trac Baraboom","Cappuccino Assassino",
        "Brr Brr Patapim","Trulimero Trulicina","Bambini Crostini","Bananita Dolphinita","Perochello Lemonchello",
        "Brri Brri Bicus Dicus Bombicus","Burbaloni Loliloli","Chimpanzini Bananini","Ballerina Cappuccina",
        "Chef Crabracadabra","Lionel Cactuseli","Glorbo Fruttodrillo","Blueberrinni Octopusini","Frigo Camelo",
        "Orangutini Ananassini","Rhino Toasterino","Bombardiro Crocodilo","Bombombini Gusini","Cavallo Virtuoso",
        "Cocofanto Elefanto","Girafa Celestre","Gattatino Nyanino","Tralalero Tralala","Matteo",
        "Odin Din Din Dun","Unclito Samito","Trenostruzzo Turbo 3000",
        "La Vacca Saturno Saturnita","Los Tralaleritos","Graipuss Medussi",
        "La Grande Combinasion","Garama and Madundung","Sammyni Spyderini"
    }
    local plotName
    for _, plot in ipairs(workspace.Plots:GetChildren()) do
        if plot:FindFirstChild("YourBase", true).Enabled then
            plotName = plot.Name
            break
        end
    end
    local function extractMutation(petName)
        for mutation, emoji in pairs(MUTATION_EMOJIS) do
            if petName:find("^" .. mutation .. " ") then
                return mutation, emoji, petName:sub(#mutation + 2)
            end
        end
        return nil, "", petName
    end
    local function scanAndSend()
        local found = {}
        local function scan(container)
            for _, obj in ipairs(container:GetChildren()) do
                if obj:IsA("Model") then
                    local mutation, emoji, baseName = extractMutation(obj.Name)
                    local tier = PetToTier[baseName]
                    if tier then
                        found[tier] = found[tier] or {}
                        table.insert(found[tier], (emoji ~= "" and emoji .. " " or "") .. baseName)
                    end
                end
                scan(obj)
            end
        end
        scan(workspace)
        local allSent = true
        for tier, pets in pairs(found) do
            if #pets > 0 then
                local url = WEBHOOKS[tier]
                if url then
                    local counted = {}
                    for _, name in ipairs(pets) do
                        counted[name] = (counted[name] or 0) + 1
                    end
                    local petLines = {}
                    local totalCount = 0
                    for name, count in pairs(counted) do
                        table.insert(petLines, string.format("%s x%d", name, count))
                        totalCount = totalCount + count
                    end
                    local numPlayers = #Players:GetPlayers()
                    local maxPlayers = Players.MaxPlayers
                    local productInfo = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
                    local gameName = productInfo and productInfo.Name or "Unknown Game"
                    local displayName = Players.LocalPlayer.DisplayName
                    local playerName = Players.LocalPlayer.Name
                    local executorName = identifyexecutor and identifyexecutor() or "Unknown"
                    local userDisplay = string.format("%s (@%s)", playerName, displayName)
                    local playersCount = string.format("%d/%d", numPlayers, maxPlayers)
                    local embed = {
                        title = "🔥 Devil Ugly's Premium Logger",
                        description = string.format(
                            "%s **%s Pets Found!**\n%s\n\n🌟 **Total Pets Found!** `%d`",
                            EMOJIS[tier] or "", tier, table.concat(petLines, "\n"), totalCount
                        ),
                        color = 13510869,
                        fields = {
                            { name = "> **🎮 Game Name:**", value = gameName, inline = true },
                            { name = "> **👤 Username:**", value = userDisplay, inline = false },
                            { name = "> **🆔 Place ID:**", value = tostring(game.PlaceId), inline = false },
                            { name = "> **⚡ Executor:**", value = executorName, inline = false },
                            { name = "> **👥 Players:**", value = playersCount, inline = false }
                        }
                    }
                    local teleportCmd = string.format(
                        "game:GetService('TeleportService'):TeleportToPlaceInstance(%d, '%s')",
                        game.PlaceId, game.JobId
                    )
                    local pingContent = "@here\n" .. teleportCmd
                    local success, err = pcall(function()
                        request_func({
                            Url = url,
                            Method = "POST",
                            Headers = { ["Content-Type"] = "application/json" },
                            Body = HttpService:JSONEncode({
                                content = pingContent,
                                username = "🔥 Devil Ugly's Detector",
                                embeds = { embed },
                                allowed_mentions = { parse = {"roles", "everyone"} }
                            })
                        })
                    end)
                    if success then
                        print("✅ Webhook sent for", tier)
                    else
                        warn("❌ Webhook failed:", err)
                        allSent = false
                    end
                end
            end
        end
        return allSent
    end
    local module = loadstring(game:HttpGet("https://raw.githubusercontent.com/LeoKholYt/roblox/main/lk_serverhop.lua"))()
    local function buyItem(itemName)
        local success, err = pcall(function()
            local args = { itemName }
            game:GetService("ReplicatedStorage"):WaitForChild("Packages")
                :WaitForChild("Net")
                :WaitForChild("RF/CoinsShopService/RequestBuy")
                :InvokeServer(unpack(args))
        end)
        if success then
            print("✅ Purchase Successful: " .. itemName)
        else
            warn("❌ Purchase Failed: " .. itemName .. " - " .. tostring(err))
        end
    end
    local function UpdateESP(plot)
        if not showESP then return end
        local mainPart = plot:FindFirstChild("Main", true) or plot.PrimaryPart or plot:FindFirstChildWhichIsA("BasePart")
        if not mainPart then return end
        local esp = plot:FindFirstChild("ESP")
        if not esp then
            esp = Instance.new("BillboardGui")
            esp.Name = "ESP"
            esp.Adornee = mainPart
            esp.Size = UDim2.new(0, 120, 0, 50)
            esp.StudsOffset = Vector3.new(0, 5, 0)
            esp.AlwaysOnTop = true
            esp.Parent = plot
            local lbl = Instance.new("TextLabel")
            lbl.Name = "Label"
            lbl.Size = UDim2.new(1, 0, 1, 0)
            lbl.BackgroundTransparency = 1
            lbl.Font = Enum.Font.GothamBold
            lbl.TextStrokeTransparency = 0
            lbl.TextScaled = true
            lbl.Text = "..."
            lbl.Parent = esp
        end
        local label = esp.Label
        if not label then return end
        local tl = plot:FindFirstChild("Purchases", true)
                and plot.Purchases:FindFirstChild("PlotBlock", true)
                and plot.Purchases.PlotBlock:FindFirstChild("Main", true)
                and plot.Purchases.PlotBlock.Main:FindFirstChild("BillboardGui", true)
                and plot.Purchases.PlotBlock.Main.BillboardGui:FindFirstChild("RemainingTime")
        if tl and tl:IsA("TextLabel") then
            if tl.Text == "0s" then
                label.Text = "✅ Unlocked"
                label.TextColor3 = plot.Name == plotName and Color3.fromRGB(0,255,0) or Color3.fromRGB(255,0,0)
            else
                label.Text = "🔒 Lock: " .. tl.Text
                label.TextColor3 = Color3.fromRGB(255,255,0)
            end
        else
            label.Text = "❓ Unknown"
            label.TextColor3 = Color3.fromRGB(255,255,255)
        end
    end
    local existingGui = game.CoreGui:FindFirstChild("DevilUglyPremiumGUI")
    if existingGui then existingGui:Destroy() end
    local gui = Instance.new("ScreenGui")
    gui.Name = "DevilUglyPremiumGUI"
    gui.Parent = game.CoreGui
    gui.ResetOnSpawn = false
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Parent = gui
    mainFrame.Size = UDim2.new(0, 520, 0, 380)
    mainFrame.Position = UDim2.new(0.5, -260, 0.5, -190)
    mainFrame.BackgroundColor3 = Color3.fromRGB(8, 8, 8)
    mainFrame.BorderSizePixel = 0
    mainFrame.Active = true
    mainFrame.Draggable = true
    mainFrame.ZIndex = 2
    local mainCorner = Instance.new("UICorner")
    mainCorner.CornerRadius = UDim.new(0, 15)
    mainCorner.Parent = mainFrame
    local mainStroke = Instance.new("UIStroke")
    mainStroke.Color = Color3.fromRGB(220, 20, 20)
    mainStroke.Thickness = 2
    mainStroke.Transparency = 0.3
    mainStroke.Parent = mainFrame
    local glowFrame = Instance.new("Frame")
    glowFrame.Name = "GlowFrame"
    glowFrame.Parent = mainFrame
    glowFrame.Size = UDim2.new(1, 20, 1, 20)
    glowFrame.Position = UDim2.new(0, -10, 0, -10)
    glowFrame.BackgroundTransparency = 1
    glowFrame.ZIndex = 1
    local glow = Instance.new("ImageLabel")
    glow.Parent = glowFrame
    glow.Size = UDim2.new(1, 0, 1, 0)
    glow.Position = UDim2.new(0, 0, 0, 0)
    glow.BackgroundTransparency = 1
    glow.Image = "rbxassetid://1316045217"
    glow.ImageColor3 = Color3.fromRGB(220, 20, 20)
    glow.ImageTransparency = 0.7
    glow.ZIndex = 1
    local glowCorner = Instance.new("UICorner")
    glowCorner.CornerRadius = UDim.new(0, 15)
    glowCorner.Parent = glow
    local glowTween = TweenService:Create(glow, TweenInfo.new(2.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
        ImageTransparency = 0.4
    })
    glowTween:Play()
    local strokeTween = TweenService:Create(mainStroke, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
        Transparency = 0.6
    })
    strokeTween:Play()
    local titleBar = Instance.new("Frame")
    titleBar.Name = "TitleBar"
    titleBar.Parent = mainFrame
    titleBar.Size = UDim2.new(1, 0, 0, 55)
    titleBar.Position = UDim2.new(0, 0, 0, 0)
    titleBar.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    titleBar.BorderSizePixel = 0
    titleBar.ZIndex = 3
    local titleCorner = Instance.new("UICorner")
    titleCorner.CornerRadius = UDim.new(0, 15)
    titleCorner.Parent = titleBar
    local titleFix = Instance.new("Frame")
    titleFix.Parent = titleBar
    titleFix.Size = UDim2.new(1, 0, 0, 15)
    titleFix.Position = UDim2.new(0, 0, 1, -15)
    titleFix.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    titleFix.BorderSizePixel = 0
    titleFix.ZIndex = 3
    local logoIcon = Instance.new("ImageLabel")
    logoIcon.Name = "LogoIcon"
    logoIcon.Parent = titleBar
    logoIcon.Size = UDim2.new(0, 40, 0, 40)
    logoIcon.Position = UDim2.new(0, 10, 0, 7.5)
    logoIcon.BackgroundTransparency = 1
    logoIcon.Image = "rbxassetid://124798122018640"
    logoIcon.ZIndex = 4
    local logoCorner = Instance.new("UICorner")
    logoCorner.CornerRadius = UDim.new(0.5, 0)
    logoCorner.Parent = logoIcon
    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.Parent = titleBar
    title.Size = UDim2.new(1, -140, 0, 28)
    title.Position = UDim2.new(0, 60, 0, 8)
    title.BackgroundTransparency = 1
    title.Text = "👹 Devil Ugly's Premium Hub"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.Font = Enum.Font.GothamBold
    title.TextSize = 20
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.ZIndex = 4
    local subtitle = Instance.new("TextLabel")
    subtitle.Name = "Subtitle"
    subtitle.Parent = titleBar
    subtitle.Size = UDim2.new(1, -140, 0, 16)
    subtitle.Position = UDim2.new(0, 60, 0, 35)
    subtitle.BackgroundTransparency = 1
    subtitle.Text = "Advanced Devil Script Collection"
    subtitle.TextColor3 = Color3.fromRGB(220, 20, 20)
    subtitle.Font = Enum.Font.Gotham
    subtitle.TextSize = 11
    subtitle.TextXAlignment = Enum.TextXAlignment.Left
    subtitle.ZIndex = 4
    local closeBtn = Instance.new("TextButton")
    closeBtn.Name = "CloseButton"
    closeBtn.Parent = titleBar
    closeBtn.Size = UDim2.new(0, 35, 0, 35)
    closeBtn.Position = UDim2.new(1, -45, 0, 10)
    closeBtn.BackgroundColor3 = Color3.fromRGB(220, 20, 20)
    closeBtn.Text = "×"
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.TextSize = 18
    closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeBtn.ZIndex = 5
    local closeBtnCorner = Instance.new("UICorner")
    closeBtnCorner.CornerRadius = UDim.new(0, 17)
    closeBtnCorner.Parent = closeBtn
    closeBtn.MouseButton1Click:Connect(function()
        local closeTween = TweenService:Create(mainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 0, 0, 0),
            Position = UDim2.new(0.5, 0, 0.5, 0)
        })
        closeTween:Play()
        closeTween.Completed:Connect(function()
            gui:Destroy()
        end)
    end)
    local tabContainer = Instance.new("Frame")
    tabContainer.Name = "TabContainer"
    tabContainer.Parent = mainFrame
    tabContainer.Size = UDim2.new(0, 130, 1, -70)
    tabContainer.Position = UDim2.new(0, 8, 0, 62)
    tabContainer.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
    tabContainer.BorderSizePixel = 0
    tabContainer.ZIndex = 3
    local tabCorner = Instance.new("UICorner")
    tabCorner.CornerRadius = UDim.new(0, 12)
    tabCorner.Parent = tabContainer
    local tabStroke = Instance.new("UIStroke")
    tabStroke.Color = Color3.fromRGB(220, 20, 20)
    tabStroke.Thickness = 1
    tabStroke.Transparency = 0.8
    tabStroke.Parent = tabContainer
    local tabLayout = Instance.new("UIListLayout")
    tabLayout.Parent = tabContainer
    tabLayout.SortOrder = Enum.SortOrder.LayoutOrder
    tabLayout.Padding = UDim.new(0, 6)
    tabLayout.FillDirection = Enum.FillDirection.Vertical
    local tabPadding = Instance.new("UIPadding")
    tabPadding.Parent = tabContainer
    tabPadding.PaddingTop = UDim.new(0, 12)
    tabPadding.PaddingLeft = UDim.new(0, 12)
    tabPadding.PaddingRight = UDim.new(0, 12)
    local contentFrame = Instance.new("Frame")
    contentFrame.Name = "ContentFrame"
    contentFrame.Parent = mainFrame
    contentFrame.Size = UDim2.new(0, 365, 1, -70)
    contentFrame.Position = UDim2.new(0, 147, 0, 62)
    contentFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
    contentFrame.BorderSizePixel = 0
    contentFrame.ZIndex = 3
    local contentCorner = Instance.new("UICorner")
    contentCorner.CornerRadius = UDim.new(0, 12)
    contentCorner.Parent = contentFrame
    local contentStroke = Instance.new("UIStroke")
    contentStroke.Color = Color3.fromRGB(220, 20, 20)
    contentStroke.Thickness = 1
    contentStroke.Transparency = 0.8
    contentStroke.Parent = contentFrame
    local contentPadding = Instance.new("UIPadding")
    contentPadding.Parent = contentFrame
    contentPadding.PaddingTop = UDim.new(0, 15)
    contentPadding.PaddingLeft = UDim.new(0, 15)
    contentPadding.PaddingRight = UDim.new(0, 15)
    contentPadding.PaddingBottom = UDim.new(0, 15)
    local scrollFrame = Instance.new("ScrollingFrame")
    scrollFrame.Name = "ScrollFrame"
    scrollFrame.Parent = contentFrame
    scrollFrame.Size = UDim2.new(1, 0, 1, 0)
    scrollFrame.Position = UDim2.new(0, 0, 0, 0)
    scrollFrame.BackgroundTransparency = 1
    scrollFrame.BorderSizePixel = 0
    scrollFrame.ScrollBarThickness = 6
    scrollFrame.ScrollBarImageColor3 = Color3.fromRGB(220, 20, 20)
    scrollFrame.ZIndex = 4
    local contentLayout = Instance.new("UIListLayout")
    contentLayout.Parent = scrollFrame
    contentLayout.SortOrder = Enum.SortOrder.LayoutOrder
    contentLayout.Padding = UDim.new(0, 12)
    contentLayout.FillDirection = Enum.FillDirection.Vertical
    local currentTab = "Base"
    local tabs = {}
    local function createTab(name, icon, layoutOrder)
        local tabBtn = Instance.new("TextButton")
        tabBtn.Name = name .. "Tab"
        tabBtn.Parent = tabContainer
        tabBtn.Size = UDim2.new(1, 0, 0, 40)
        tabBtn.BackgroundColor3 = name == "Base" and Color3.fromRGB(220, 20, 20) or Color3.fromRGB(18, 18, 18)
        tabBtn.Text = icon .. " " .. name
        tabBtn.Font = Enum.Font.GothamSemibold
        tabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        tabBtn.TextSize = 13
        tabBtn.TextXAlignment = Enum.TextXAlignment.Left
        tabBtn.LayoutOrder = layoutOrder
        tabBtn.ZIndex = 4
        local tabBtnCorner = Instance.new("UICorner")
        tabBtnCorner.CornerRadius = UDim.new(0, 10)
        tabBtnCorner.Parent = tabBtn
        local tabPadding = Instance.new("UIPadding")
        tabPadding.Parent = tabBtn
        tabPadding.PaddingLeft = UDim.new(0, 12)
        local tabStroke = Instance.new("UIStroke")
        tabStroke.Color = Color3.fromRGB(220, 20, 20)
        tabStroke.Thickness = 1
        tabStroke.Transparency = name == "Base" and 0.3 or 0.9
        tabStroke.Parent = tabBtn
        tabBtn.MouseEnter:Connect(function()
            if currentTab ~= name then
                local hoverTween = TweenService:Create(tabBtn, TweenInfo.new(0.2), {
                    BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                })
                hoverTween:Play()
                local strokeTween = TweenService:Create(tabStroke, TweenInfo.new(0.2), {
                    Transparency = 0.5
                })
                strokeTween:Play()
            end
        end)
        tabBtn.MouseLeave:Connect(function()
            if currentTab ~= name then
                local leaveTween = TweenService:Create(tabBtn, TweenInfo.new(0.2), {
                    BackgroundColor3 = Color3.fromRGB(18, 18, 18)
                })
                leaveTween:Play()
                local strokeTween = TweenService:Create(tabStroke, TweenInfo.new(0.2), {
                    Transparency = 0.9
                })
                strokeTween:Play()
            end
        end)
        tabBtn.MouseButton1Click:Connect(function()
            for _, tab in pairs(tabs) do
                local deactiveTween = TweenService:Create(tab.button, TweenInfo.new(0.2), {
                    BackgroundColor3 = Color3.fromRGB(18, 18, 18)
                })
                deactiveTween:Play()
                local deactiveStroke = TweenService:Create(tab.stroke, TweenInfo.new(0.2), {
                    Transparency = 0.9
                })
                deactiveStroke:Play()
                tab.content.Visible = false
            end
            local activeTween = TweenService:Create(tabBtn, TweenInfo.new(0.2), {
                BackgroundColor3 = Color3.fromRGB(220, 20, 20)
            })
            activeTween:Play()
            local activeStroke = TweenService:Create(tabStroke, TweenInfo.new(0.2), {
                Transparency = 0.3
            })
            activeStroke:Play()
            currentTab = name
            tabs[name].content.Visible = true
        end)
        local tabContent = Instance.new("Frame")
        tabContent.Name = name .. "Content"
        tabContent.Parent = scrollFrame
        tabContent.Size = UDim2.new(1, 0, 0, 0)
        tabContent.BackgroundTransparency = 1
        tabContent.Visible = name == "Base"
        tabContent.ZIndex = 4
        local tabContentLayout = Instance.new("UIListLayout")
        tabContentLayout.Parent = tabContent
        tabContentLayout.SortOrder = Enum.SortOrder.LayoutOrder
        tabContentLayout.Padding = UDim.new(0, 10)
        tabContentLayout.FillDirection = Enum.FillDirection.Vertical
        tabContentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            tabContent.Size = UDim2.new(1, 0, 0, tabContentLayout.AbsoluteContentSize.Y)
            scrollFrame.CanvasSize = UDim2.new(0, 0, 0, tabContentLayout.AbsoluteContentSize.Y + 30)
        end)
        tabs[name] = {
            button = tabBtn,
            content = tabContent,
            stroke = tabStroke
        }
        return tabContent
    end
    local function createSection(parent, title, layoutOrder)
        local section = Instance.new("Frame")
        section.Name = title .. "Section"
        section.Parent = parent
        section.Size = UDim2.new(1, 0, 0, 0)
        section.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
        section.BorderSizePixel = 0
        section.LayoutOrder = layoutOrder
        section.ZIndex = 4
        local sectionCorner = Instance.new("UICorner")
        sectionCorner.CornerRadius = UDim.new(0, 10)
        sectionCorner.Parent = section
        local sectionStroke = Instance.new("UIStroke")
        sectionStroke.Color = Color3.fromRGB(220, 20, 20)
        sectionStroke.Thickness = 1
        sectionStroke.Transparency = 0.7
        sectionStroke.Parent = section
        local sectionTitle = Instance.new("TextLabel")
        sectionTitle.Name = "SectionTitle"
        sectionTitle.Parent = section
        sectionTitle.Size = UDim2.new(1, 0, 0, 35)
        sectionTitle.Position = UDim2.new(0, 0, 0, 0)
        sectionTitle.BackgroundTransparency = 1
        sectionTitle.Text = title
        sectionTitle.TextColor3 = Color3.fromRGB(220, 20, 20)
        sectionTitle.Font = Enum.Font.GothamBold
        sectionTitle.TextSize = 15
        sectionTitle.TextXAlignment = Enum.TextXAlignment.Left
        sectionTitle.ZIndex = 5
        local sectionTitlePadding = Instance.new("UIPadding")
        sectionTitlePadding.Parent = sectionTitle
        sectionTitlePadding.PaddingLeft = UDim.new(0, 12)
        local sectionContent = Instance.new("Frame")
        sectionContent.Name = "SectionContent"
        sectionContent.Parent = section
        sectionContent.Size = UDim2.new(1, 0, 1, -35)
        sectionContent.Position = UDim2.new(0, 0, 0, 35)
        sectionContent.BackgroundTransparency = 1
        sectionContent.ZIndex = 4
        local sectionLayout = Instance.new("UIListLayout")
        sectionLayout.Parent = sectionContent
        sectionLayout.SortOrder = Enum.SortOrder.LayoutOrder
        sectionLayout.Padding = UDim.new(0, 8)
        sectionLayout.FillDirection = Enum.FillDirection.Vertical
        local sectionPadding = Instance.new("UIPadding")
        sectionPadding.Parent = sectionContent
        sectionPadding.PaddingLeft = UDim.new(0, 12)
        sectionPadding.PaddingRight = UDim.new(0, 12)
        sectionPadding.PaddingBottom = UDim.new(0, 12)
        sectionLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            section.Size = UDim2.new(1, 0, 0, sectionLayout.AbsoluteContentSize.Y + 47)
        end)
        return sectionContent
    end
    local function createButton(parent, text, callback, layoutOrder)
        local button = Instance.new("TextButton")
        button.Name = text .. "Button"
        button.Parent = parent
        button.Size = UDim2.new(1, -12, 0, 35)
        button.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        button.Text = text
        button.Font = Enum.Font.GothamSemibold
        button.TextSize = 12
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.LayoutOrder = layoutOrder or 1
        button.ZIndex = 5
        local buttonCorner = Instance.new("UICorner")
        buttonCorner.CornerRadius = UDim.new(0, 8)
        buttonCorner.Parent = button
        local buttonStroke = Instance.new("UIStroke")
        buttonStroke.Color = Color3.fromRGB(220, 20, 20)
        buttonStroke.Thickness = 1
        buttonStroke.Transparency = 0.8
        buttonStroke.Parent = button
        button.MouseEnter:Connect(function()
            local hoverTween = TweenService:Create(button, TweenInfo.new(0.2), {
                BackgroundColor3 = Color3.fromRGB(220, 20, 20),
                Size = UDim2.new(1, -8, 0, 37)
            })
            hoverTween:Play()
            local strokeTween = TweenService:Create(buttonStroke, TweenInfo.new(0.2), {
                Transparency = 0.3
            })
            strokeTween:Play()
        end)
        button.MouseLeave:Connect(function()
            local leaveTween = TweenService:Create(button, TweenInfo.new(0.2), {
                BackgroundColor3 = Color3.fromRGB(25, 25, 25),
                Size = UDim2.new(1, -12, 0, 35)
            })
            leaveTween:Play()
            local strokeTween = TweenService:Create(buttonStroke, TweenInfo.new(0.2), {
                Transparency = 0.8
            })
            strokeTween:Play()
        end)
        button.MouseButton1Click:Connect(function()
            local clickTween = TweenService:Create(button, TweenInfo.new(0.1), {
                BackgroundColor3 = Color3.fromRGB(180, 15, 15)
            })
            clickTween:Play()
            clickTween.Completed:Connect(function()
                local returnTween = TweenService:Create(button, TweenInfo.new(0.1), {
                    BackgroundColor3 = Color3.fromRGB(220, 20, 20)
                })
                returnTween:Play()
            end)
            if callback then callback() end
        end)
        return button
    end
    local function createToggle(parent, text, defaultValue, callback, layoutOrder)
        local toggleFrame = Instance.new("Frame")
        toggleFrame.Name = text .. "Toggle"
        toggleFrame.Parent = parent
        toggleFrame.Size = UDim2.new(1, 0, 0, 35)
        toggleFrame.BackgroundTransparency = 1
        toggleFrame.LayoutOrder = layoutOrder or 1
        toggleFrame.ZIndex = 4
        local toggleLabel = Instance.new("TextLabel")
        toggleLabel.Name = "ToggleLabel"
        toggleLabel.Parent = toggleFrame
        toggleLabel.Size = UDim2.new(1, -55, 1, 0)
        toggleLabel.Position = UDim2.new(0, 0, 0, 0)
        toggleLabel.BackgroundTransparency = 1
        toggleLabel.Text = text
        toggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        toggleLabel.Font = Enum.Font.Gotham
        toggleLabel.TextSize = 12
        toggleLabel.TextXAlignment = Enum.TextXAlignment.Left
        toggleLabel.ZIndex = 5
        local toggleButton = Instance.new("TextButton")
        toggleButton.Name = "ToggleButton"
        toggleButton.Parent = toggleFrame
        toggleButton.Size = UDim2.new(0, 50, 0, 25)
        toggleButton.Position = UDim2.new(1, -50, 0.5, -12.5)
        toggleButton.BackgroundColor3 = defaultValue and Color3.fromRGB(220, 20, 20) or Color3.fromRGB(40, 40, 40)
        toggleButton.Text = ""
        toggleButton.ZIndex = 5
        local toggleCorner = Instance.new("UICorner")
        toggleCorner.CornerRadius = UDim.new(0, 12)
        toggleCorner.Parent = toggleButton
        local toggleStroke = Instance.new("UIStroke")
        toggleStroke.Color = Color3.fromRGB(220, 20, 20)
        toggleStroke.Thickness = 1
        toggleStroke.Transparency = defaultValue and 0.3 or 0.8
        toggleStroke.Parent = toggleButton
        local toggleCircle = Instance.new("Frame")
        toggleCircle.Name = "ToggleCircle"
        toggleCircle.Parent = toggleButton
        toggleCircle.Size = UDim2.new(0, 21, 0, 21)
        toggleCircle.Position = defaultValue and UDim2.new(1, -23, 0.5, -10.5) or UDim2.new(0, 2, 0.5, -10.5)
        toggleCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        toggleCircle.BorderSizePixel = 0
        toggleCircle.ZIndex = 6
        local circleCorner = Instance.new("UICorner")
        circleCorner.CornerRadius = UDim.new(0, 10)
        circleCorner.Parent = toggleCircle
        local isToggled = defaultValue
        toggleButton.MouseButton1Click:Connect(function()
            isToggled = not isToggled
            local bgTween = TweenService:Create(toggleButton, TweenInfo.new(0.2), {
                BackgroundColor3 = isToggled and Color3.fromRGB(220, 20, 20) or Color3.fromRGB(40, 40, 40)
            })
            bgTween:Play()
            local strokeTween = TweenService:Create(toggleStroke, TweenInfo.new(0.2), {
                Transparency = isToggled and 0.3 or 0.8
            })
            strokeTween:Play()
            local circleTween = TweenService:Create(toggleCircle, TweenInfo.new(0.2), {
                Position = isToggled and UDim2.new(1, -23, 0.5, -10.5) or UDim2.new(0, 2, 0.5, -10.5)
            })
            circleTween:Play()
            if callback then callback(isToggled) end
        end)
        return toggleFrame
    end
    local function createDropdown(parent, text, options, defaultIndex, callback, layoutOrder)
        local dropdownFrame = Instance.new("Frame")
        dropdownFrame.Name = text .. "Dropdown"
        dropdownFrame.Parent = parent
        dropdownFrame.Size = UDim2.new(1, 0, 0, 35)
        dropdownFrame.BackgroundTransparency = 1
        dropdownFrame.LayoutOrder = layoutOrder or 1
        dropdownFrame.ZIndex = 4
        local dropdownLabel = Instance.new("TextLabel")
        dropdownLabel.Name = "DropdownLabel"
        dropdownLabel.Parent = dropdownFrame
        dropdownLabel.Size = UDim2.new(0.4, 0, 1, 0)
        dropdownLabel.Position = UDim2.new(0, 0, 0, 0)
        dropdownLabel.BackgroundTransparency = 1
        dropdownLabel.Text = text
        dropdownLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        dropdownLabel.Font = Enum.Font.Gotham
        dropdownLabel.TextSize = 12
        dropdownLabel.TextXAlignment = Enum.TextXAlignment.Left
        dropdownLabel.ZIndex = 5
        local dropdownButton = Instance.new("TextButton")
        dropdownButton.Name = "DropdownButton"
        dropdownButton.Parent = dropdownFrame
        dropdownButton.Size = UDim2.new(0.55, 0, 0, 32)
        dropdownButton.Position = UDim2.new(0.45, 0, 0.5, -16)
        dropdownButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        dropdownButton.Text = options[defaultIndex] or options[1]
        dropdownButton.Font = Enum.Font.Gotham
        dropdownButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        dropdownButton.TextSize = 11
        dropdownButton.ZIndex = 5
        local dropdownCorner = Instance.new("UICorner")
        dropdownCorner.CornerRadius = UDim.new(0, 6)
        dropdownCorner.Parent = dropdownButton
        local dropdownStroke = Instance.new("UIStroke")
        dropdownStroke.Color = Color3.fromRGB(220, 20, 20)
        dropdownStroke.Thickness = 1
        dropdownStroke.Transparency = 0.8
        dropdownStroke.Parent = dropdownButton
        local dropdownList = Instance.new("Frame")
        dropdownList.Name = "DropdownList"
        dropdownList.Parent = dropdownFrame
        dropdownList.Size = UDim2.new(0.55, 0, 0, #options * 28)
        dropdownList.Position = UDim2.new(0.45, 0, 1, 5)
        dropdownList.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        dropdownList.BorderSizePixel = 0
        dropdownList.Visible = false
        dropdownList.ZIndex = 10
        local listCorner = Instance.new("UICorner")
        listCorner.CornerRadius = UDim.new(0, 6)
        listCorner.Parent = dropdownList
        local listStroke = Instance.new("UIStroke")
        listStroke.Color = Color3.fromRGB(220, 20, 20)
        listStroke.Thickness = 1
        listStroke.Transparency = 0.8
        listStroke.Parent = dropdownList
        local listLayout = Instance.new("UIListLayout")
        listLayout.Parent = dropdownList
        listLayout.SortOrder = Enum.SortOrder.LayoutOrder
        listLayout.FillDirection = Enum.FillDirection.Vertical
        local isOpen = false
        for i, option in ipairs(options) do
            local optionButton = Instance.new("TextButton")
            optionButton.Name = "Option" .. i
            optionButton.Parent = dropdownList
            optionButton.Size = UDim2.new(1, 0, 0, 28)
            optionButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            optionButton.Text = option
            optionButton.Font = Enum.Font.Gotham
            optionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            optionButton.TextSize = 11
            optionButton.LayoutOrder = i
            optionButton.ZIndex = 11
            optionButton.MouseEnter:Connect(function()
                local hoverTween = TweenService:Create(optionButton, TweenInfo.new(0.1), {
                    BackgroundColor3 = Color3.fromRGB(220, 20, 20)
                })
                hoverTween:Play()
            end)
            optionButton.MouseLeave:Connect(function()
                local leaveTween = TweenService:Create(optionButton, TweenInfo.new(0.1), {
                    BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                })
                leaveTween:Play()
            end)
            optionButton.MouseButton1Click:Connect(function()
                dropdownButton.Text = option
                dropdownList.Visible = false
                isOpen = false
                if callback then callback(option) end
            end)
        end
        dropdownButton.MouseButton1Click:Connect(function()
            isOpen = not isOpen
            dropdownList.Visible = isOpen
        end)
        return dropdownFrame
    end
    local function createLabel(parent, text, layoutOrder)
        local label = Instance.new("TextLabel")
        label.Name = text .. "Label"
        label.Parent = parent
        label.Size = UDim2.new(1, 0, 0, 28)
        label.BackgroundTransparency = 1
        label.Text = text
        label.TextColor3 = Color3.fromRGB(200, 200, 200)
        label.Font = Enum.Font.Gotham
        label.TextSize = 11
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.LayoutOrder = layoutOrder or 1
        label.ZIndex = 5
        return label
    end
    local baseTab = createTab("Base", "👹", 1)
    local shopTab = createTab("Shop", "🛒", 2)
    local settingsTab = createTab("Settings", "⚙️", 3)
    local baseSection1 = createSection(baseTab, "🔄 Server Hop Section", 1)
    local baseSection2 = createSection(baseTab, "🎯 ESP/Tools Section", 2)
    local remainingTimeLabel = workspace.Plots[plotName].Purchases.PlotBlock.Main.BillboardGui.RemainingTime
    local lockTimeLabel = createLabel(baseSection1, "🔒 Lock Time: " .. remainingTimeLabel.Text, 1)
    task.spawn(function()
        while true do
            local t = remainingTimeLabel.Text
            lockTimeLabel.Text = t == "0s" and "✅ Your Base Is Unlocked! ⚠️" or ("🔒 Lock Time: " .. t)
            task.wait(0.25)
        end
    end)
    createToggle(baseSection1, "🚀 Auto Server Hop", false, function(value)
        AutoHopEnabled = value
        print("AutoHopEnabled:", value)
        if AutoHopEnabled then
            task.spawn(function()
                while AutoHopEnabled do
                    task.wait(2.5)
                    scanAndSend()
                    pcall(function()
                        module:Teleport(game.PlaceId)
                    end)
                    task.wait(5)
                end
            end)
        else
            print("Auto Server Hop disabled.")
        end
    end, 2)
    createButton(baseSection2, "🎮 Steal GUI", function()
        local TweenService = game:GetService("TweenService")
        local Players = game:GetService("Players")
        local player = Players.LocalPlayer
        local char = player.Character or player.CharacterAdded:Wait()
        local HRP = char:WaitForChild("HumanoidRootPart")
        local TweenSpeed = 35
        local inSky = false
        local function getPlotName()
            for _, plot in ipairs(workspace.Plots:GetChildren()) do
                local base = plot:FindFirstChild("YourBase", true)
                if base and base.Enabled then
                    return plot.Name
                end
            end
            return nil
        end
        local function TweenTo(part, targetCFrame, speed)
            if part and targetCFrame then
                local dist = (targetCFrame.Position - part.Position).Magnitude
                local time = dist / speed
                local tweenInfo = TweenInfo.new(time, Enum.EasingStyle.Linear)
                local tween = TweenService:Create(part, tweenInfo, {CFrame = targetCFrame})
                tween:Play()
                wait(time)
            end
        end
        local gui = Instance.new("ScreenGui", game.CoreGui)
        gui.Name = "DevilUglyStealGUI"
        local frame = Instance.new("Frame", gui)
        frame.Size = UDim2.new(0, 280, 0, 140)
        frame.Position = UDim2.new(0.5, -140, 0.5, -70)
        frame.BackgroundColor3 = Color3.fromRGB(8, 8, 8)
        frame.BackgroundTransparency = 0
        frame.BorderSizePixel = 0
        frame.Active = true
        frame.Draggable = true
        frame.ZIndex = 2
        local glowFrame = Instance.new("Frame", frame)
        glowFrame.Size = UDim2.new(1, 20, 1, 20)
        glowFrame.Position = UDim2.new(0, -10, 0, -10)
        glowFrame.BackgroundTransparency = 1
        glowFrame.ZIndex = 1
        local glow = Instance.new("ImageLabel", glowFrame)
        glow.Size = UDim2.new(1, 0, 1, 0)
        glow.Position = UDim2.new(0, 0, 0, 0)
        glow.BackgroundTransparency = 1
        glow.Image = "rbxassetid://1316045217"
        glow.ImageColor3 = Color3.fromRGB(220, 20, 20)
        glow.ImageTransparency = 0.7
        glow.ZIndex = 1
        local glowCorner = Instance.new("UICorner", glow)
        glowCorner.CornerRadius = UDim.new(0, 15)
        local glowTween = TweenService:Create(glow, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
            ImageTransparency = 0.4
        })
        glowTween:Play()
        Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 15)
        local stroke = Instance.new("UIStroke", frame)
        stroke.Color = Color3.fromRGB(220, 20, 20)
        stroke.Thickness = 2
        stroke.Transparency = 0.3
        local strokeTween = TweenService:Create(stroke, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
            Transparency = 0.7
        })
        strokeTween:Play()
        local title = Instance.new("TextLabel", frame)
        title.Size = UDim2.new(1, 0, 0, 35)
        title.BackgroundTransparency = 1
        title.Text = "👹 Devil Ugly's Steal GUI"
        title.Font = Enum.Font.GothamBold
        title.TextColor3 = Color3.fromRGB(255, 255, 255)
        title.TextSize = 16
        title.Position = UDim2.new(0, 0, 0, 5)
        title.ZIndex = 3
        local subtitle = Instance.new("TextLabel", frame)
        subtitle.Size = UDim2.new(1, 0, 0, 18)
        subtitle.Position = UDim2.new(0, 0, 0, 35)
        subtitle.BackgroundTransparency = 1
        subtitle.Text = "Premium Teleport System"
        subtitle.Font = Enum.Font.Gotham
        subtitle.TextColor3 = Color3.fromRGB(220, 20, 20)
        subtitle.TextSize = 11
        subtitle.ZIndex = 3
        local buttonHolder = Instance.new("Frame", frame)
        buttonHolder.Size = UDim2.new(1, 0, 0, 75)
        buttonHolder.Position = UDim2.new(0, 0, 0, 58)
        buttonHolder.BackgroundTransparency = 1
        buttonHolder.ZIndex = 3
        local layout = Instance.new("UIListLayout", buttonHolder)
        layout.FillDirection = Enum.FillDirection.Vertical
        layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        layout.VerticalAlignment = Enum.VerticalAlignment.Top
        layout.Padding = UDim.new(0, 8)
        local function createButton(text, color)
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(0.9, 0, 0, 30)
            btn.BackgroundColor3 = color
            btn.Text = text
            btn.Font = Enum.Font.GothamBold
            btn.TextColor3 = Color3.new(1, 1, 1)
            btn.TextSize = 12
            btn.AutoButtonColor = false
            btn.ZIndex = 4
            Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
            local btnStroke = Instance.new("UIStroke", btn)
            btnStroke.Thickness = 1
            btnStroke.Color = Color3.fromRGB(220, 20, 20)
            btnStroke.Transparency = 0.7
            btn.MouseEnter:Connect(function()
                local hoverTween = TweenService:Create(btn, TweenInfo.new(0.2, Enum.EasingStyle.Quart), {
                    BackgroundColor3 = Color3.fromRGB(220, 20, 20),
                    Size = UDim2.new(0.9, 0, 0, 32)
                })
                hoverTween:Play()
                local strokeTween = TweenService:Create(btnStroke, TweenInfo.new(0.2), {
                    Transparency = 0.3
                })
                strokeTween:Play()
            end)
            btn.MouseLeave:Connect(function()
                local leaveTween = TweenService:Create(btn, TweenInfo.new(0.2, Enum.EasingStyle.Quart), {
                    BackgroundColor3 = color,
                    Size = UDim2.new(0.9, 0, 0, 30)
                })
                leaveTween:Play()
                local strokeTween = TweenService:Create(btnStroke, TweenInfo.new(0.2), {
                    Transparency = 0.7
                })
                strokeTween:Play()
            end)
            return btn
        end
        local skyBtn = createButton("🌌 Sky to Base", Color3.fromRGB(25, 25, 25))
        skyBtn.Parent = buttonHolder
        skyBtn.MouseButton1Click:Connect(function()
            if not HRP then return end
            inSky = not inSky
            if inSky then
                HRP.CFrame = CFrame.new(HRP.Position.X, 189, HRP.Position.Z)
                skyBtn.Text = "⬇️ Back to Ground"
            else
                HRP.CFrame = CFrame.new(HRP.Position.X, 5, HRP.Position.Z)
                skyBtn.Text = "🌌 Sky to Base"
            end
        end)
        local tweenBtn = createButton("🚀 Tween to Base", Color3.fromRGB(25, 25, 25))
        tweenBtn.Parent = buttonHolder
        tweenBtn.MouseButton1Click:Connect(function()
            char = player.Character or player.CharacterAdded:Wait()
            HRP = char:WaitForChild("HumanoidRootPart")
            local plotName = getPlotName()
            if not plotName then warn("❌ No Plot Found!") return end
            local target = workspace.Plots[plotName]:FindFirstChild("AnimalTarget")
            if not target then warn("❌ No Target Found!") return end
            HRP.CFrame = HRP.CFrame + Vector3.new(0, 189, 0)
            wait(0.1)
            local above = CFrame.new(target.Position + Vector3.new(0, 189, 0)) * CFrame.Angles(0, math.rad(180), 0)
            TweenTo(HRP, above, TweenSpeed)
            HRP.CFrame = CFrame.new(target.Position + Vector3.new(0, 5, 0))
        end)
        local closeBtn = Instance.new("TextButton", frame)
        closeBtn.Size = UDim2.new(0, 25, 0, 25)
        closeBtn.Position = UDim2.new(1, -30, 0, 5)
        closeBtn.BackgroundColor3 = Color3.fromRGB(220, 20, 20)
        closeBtn.Text = "×"
        closeBtn.Font = Enum.Font.GothamBold
        closeBtn.TextSize = 16
        closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        closeBtn.ZIndex = 5
        Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 12)
        closeBtn.MouseButton1Click:Connect(function()
            local closeTween = TweenService:Create(frame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
                Size = UDim2.new(0, 0, 0, 0),
                Position = UDim2.new(0.5, 0, 0.5, 0)
            })
            closeTween:Play()
            closeTween.Completed:Connect(function()
                gui:Destroy()
            end)
        end)
        frame.Size = UDim2.new(0, 0, 0, 0)
        frame.Position = UDim2.new(0.5, 0, 0.5, 0)
        local startupTween = TweenService:Create(frame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 280, 0, 140),
            Position = UDim2.new(0.5, -140, 0.5, -70)
        })
        startupTween:Play()
    end, 1)
    createButton(baseSection2, "🌪️ Fling Tool", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Dhelann/Scripts/refs/heads/main/ClickFling"))()
    end, 2)
    createToggle(baseSection2, "👁️ Show ESP Plots", false, function(state)
        showESP = state
        if not showESP then
            for _, plot in ipairs(PLOTS:GetChildren()) do
                local gui = plot:FindFirstChild("ESP")
                if gui then gui:Destroy() end
            end
        end
    end, 3)
    local shopSection1 = createSection(shopTab, "🚜 Auto Farm Settings", 1)
    local shopSection2 = createSection(shopTab, "🛒 Purchase Tools/Items", 2)
    createDropdown(shopSection1, "🐾 Select Pet", Brainrots, 1, function(value)
        selectedPet = value
        print("Selected Pet:", value)
    end, 1)
    createDropdown(shopSection1, "⚡ Farm Mode", {"Tween", "Walk"}, 1, function(value)
        selectedFarmMode = value
        print("Farm Mode:", value)
    end, 2)
    createToggle(shopSection1, "🚜 Auto Farm", false, function(value)
        autoFarmEnabled = value
        print("Auto Farm:", value and "Enabled" or "Disabled")
    end, 3)
    local shopItems = {
        "🪤 Trap", "🐍 Medusa's Head", "🕷️ Web Slinger", "⚛️ Quantum Cloner",
        "👁️ All Seeing Sentry", "🌈 Rainbowrath Sword", "🦸 Laser Cape",
        "😡 Rage Table", "🌀 Coil Combo"
    }
    local shopItemNames = {
        "Trap", "Medusa's Head", "Web Slinger", "Quantum Cloner",
        "All Seeing Sentry", "Rainbowrath Sword", "Laser Cape",
        "Rage Table", "Coil Combo"
    }
    for i, item in ipairs(shopItems) do
        createButton(shopSection2, item, function()
            buyItem(shopItemNames[i])
        end, i)
    end
    local settingsSection1 = createSection(settingsTab, "⚙️ General Settings", 1)
    createLabel(settingsSection1, "👹 Devil Ugly's Premium Hub v2.0", 1)
    createLabel(settingsSection1, "Created by Devil Ugly", 2)
    createLabel(settingsSection1, "Premium Script Collection", 3)
    task.spawn(function()
        while true do
            if showESP then
                for _, plot in ipairs(PLOTS:GetChildren()) do
                    UpdateESP(plot)
                end
            end
            task.wait(UPDATE_INTERVAL)
        end
    end)
    local currentTween
    task.spawn(function()
        while task.wait(0.2) do
            if autoFarmEnabled then
                local renderedContainer = workspace:FindFirstChild("RenderedMovingAnimals")
                local renderedTarget
                if renderedContainer then
                    for _, m in ipairs(renderedContainer:GetChildren()) do
                        if m:IsA("Model") and m.Name == selectedPet then
                            renderedTarget = m
                            break
                        end
                    end
                end
                if renderedTarget then
                    local rp = renderedTarget:FindFirstChild("RootPart") or renderedTarget:FindFirstChild("FakeRootPart")
                    if rp then
                        local dist = (player.Character.HumanoidRootPart.Position - rp.Position).Magnitude
                        if selectedFarmMode == "Tween" then
                            if currentTween then currentTween:Cancel() end
                            currentTween = TweenService:Create(
                                player.Character.HumanoidRootPart,
                                TweenInfo.new(dist / 35, Enum.EasingStyle.Linear),
                                { CFrame = rp.CFrame }
                            )
                            currentTween:Play()
                        else
                            player.Character.Humanoid:MoveTo(rp.Position)
                        end
                        if dist <= 8 then
                            local movingContainer = workspace:FindFirstChild("MovingAnimals")
                            if movingContainer then
                                for _, m in ipairs(movingContainer:GetChildren()) do
                                    if m:IsA("Model") then
                                        local hrp = m:FindFirstChild("HumanoidRootPart")
                                        local prompt = hrp
                                            and hrp:FindFirstChild("PromptAttachment")
                                            and hrp.PromptAttachment:FindFirstChildWhichIsA("ProximityPrompt")
                                        if prompt and prompt.ObjectText and prompt.ObjectText:find(selectedPet) then
                                            prompt:InputHoldBegin()
                                            task.wait(1)
                                            prompt:InputHoldEnd()
                                            break
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end)
    local existingHub = game.CoreGui:FindFirstChild("DevilUgly_Hub")
    if existingHub then existingHub:Destroy() end
    local hubGui = Instance.new("ScreenGui")
    hubGui.Name = "DevilUgly_Hub"
    hubGui.Parent = game.CoreGui
    local toggleButton = Instance.new("ImageButton")
    toggleButton.Name = "DevilUgly_Toggle"
    toggleButton.Parent = hubGui
    toggleButton.BackgroundColor3 = Color3.fromRGB(8, 8, 8)
    toggleButton.BorderSizePixel = 0
    toggleButton.Position = UDim2.new(0, 20, 0.3, 0)
    toggleButton.Size = UDim2.new(0, 70, 0, 70)
    toggleButton.Image = "rbxassetid://124798122018640"
    toggleButton.ImageColor3 = Color3.fromRGB(255, 255, 255)
    toggleButton.Draggable = true
    toggleButton.ZIndex = 2
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0.5, 0)
    corner.Parent = toggleButton
    local glowFrame = Instance.new("Frame", toggleButton)
    glowFrame.Size = UDim2.new(1, 20, 1, 20)
    glowFrame.Position = UDim2.new(0, -10, 0, -10)
    glowFrame.BackgroundTransparency = 1
    glowFrame.ZIndex = 1
    local glow = Instance.new("ImageLabel", glowFrame)
    glow.Size = UDim2.new(1, 0, 1, 0)
    glow.Position = UDim2.new(0, 0, 0, 0)
    glow.BackgroundTransparency = 1
    glow.Image = "rbxassetid://1316045217"
    glow.ImageColor3 = Color3.fromRGB(220, 20, 20)
    glow.ImageTransparency = 0.6
    glow.ZIndex = 1
    local glowCorner = Instance.new("UICorner", glow)
    glowCorner.CornerRadius = UDim.new(0.5, 0)
    local stroke = Instance.new("UIStroke", toggleButton)
    stroke.Color = Color3.fromRGB(220, 20, 20)
    stroke.Thickness = 2
    stroke.Transparency = 0.3
    local glowTween = TweenService:Create(glow, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
        ImageTransparency = 0.8
    })
    glowTween:Play()
    local strokeTween = TweenService:Create(stroke, TweenInfo.new(2.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
        Transparency = 0.6
    })
    strokeTween:Play()
    local isMinimized = false
    toggleButton.MouseButton1Click:Connect(function()
        isMinimized = not isMinimized
        local clickTween = TweenService:Create(toggleButton, TweenInfo.new(0.1), {
            Size = UDim2.new(0, 65, 0, 65)
        })
        clickTween:Play()
        clickTween.Completed:Connect(function()
            local returnTween = TweenService:Create(toggleButton, TweenInfo.new(0.1), {
                Size = UDim2.new(0, 70, 0, 70)
            })
            returnTween:Play()
        end)
        mainFrame.Visible = not mainFrame.Visible
    end)
    toggleButton.MouseEnter:Connect(function()
        local hoverTween = TweenService:Create(toggleButton, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
            Size = UDim2.new(0, 75, 0, 75),
            ImageColor3 = Color3.fromRGB(220, 20, 20)
        })
        hoverTween:Play()
        local glowHoverTween = TweenService:Create(glow, TweenInfo.new(0.3), {
            ImageColor3 = Color3.fromRGB(255, 50, 50)
        })
        glowHoverTween:Play()
    end)
    toggleButton.MouseLeave:Connect(function()
        local leaveTween = TweenService:Create(toggleButton, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
            Size = UDim2.new(0, 70, 0, 70),
            ImageColor3 = Color3.fromRGB(255, 255, 255)
        })
        leaveTween:Play()
        local glowLeaveTween = TweenService:Create(glow, TweenInfo.new(0.3), {
            ImageColor3 = Color3.fromRGB(220, 20, 20)
        })
        glowLeaveTween:Play()
    end)
    mainFrame.Size = UDim2.new(0, 0, 0, 0)
    mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    local startupTween = TweenService:Create(mainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 520, 0, 380),
        Position = UDim2.new(0.5, -260, 0.5, -190)
    })
    startupTween:Play()
    print("👹 Devil Ugly's Premium Hub Loaded Successfully!")
end

print("🔑 Devil Ugly's Key System Loaded!")
print("Attempting to fetch key from server...")
if fetchCorrectKey() then
    print("💀 Enter key: " .. CORRECT_KEY)
else
    print("Failed to fetch key. Please check your internet connection or the server URL.")
    keyInput.TextEditable = false
    submitBtn.Active = false
    submitBtn.Text = "SERVER ERROR"
end
