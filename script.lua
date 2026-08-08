--------------------------- SETTINGS ---------------------------
_G.HeadSize = 50
_G.Transparency = 0.5
_G.MaxDistance = 80
_G.Enabled = true
----------------------------------------------------------------

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer

--------------------------- INTRO ---------------------------
local function playIntro()
    local introGui = Instance.new("ScreenGui")
    introGui.Name = "HamimsfyIntro"
    introGui.IgnoreGuiInset = true
    introGui.ResetOnSpawn = false
    introGui.Parent = CoreGui

    local bg = Instance.new("Frame")
    bg.Size = UDim2.new(1, 0, 1, 0)
    bg.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
    bg.BorderSizePixel = 0
    bg.Parent = introGui

    local logo = Instance.new("TextLabel")
    logo.Size = UDim2.new(0, 400, 0, 80)
    logo.Position = UDim2.new(0.5, -200, 0.4, -40)
    logo.BackgroundTransparency = 1
    logo.Text = "HAMIMSFY"
    logo.TextColor3 = Color3.fromRGB(0, 170, 255)
    logo.TextSize = 48
    logo.Font = Enum.Font.GothamBlack
    logo.TextTransparency = 1
    logo.Parent = bg

    local subtitle = Instance.new("TextLabel")
    subtitle.Size = UDim2.new(0, 400, 0, 30)
    subtitle.Position = UDim2.new(0.5, -200, 0.5, 10)
    subtitle.BackgroundTransparency = 1
    subtitle.Text = "Mobs Hitbox Expander"
    subtitle.TextColor3 = Color3.fromRGB(200, 200, 200)
    subtitle.TextSize = 18
    subtitle.Font = Enum.Font.Gotham
    subtitle.TextTransparency = 1
    subtitle.Parent = bg

    local version = Instance.new("TextLabel")
    version.Size = UDim2.new(0, 400, 0, 20)
    version.Position = UDim2.new(0.5, -200, 0.55, 20)
    version.BackgroundTransparency = 1
    version.Text = "Experiment  |  Only for this game"
    version.TextColor3 = Color3.fromRGB(100, 100, 100)
    version.TextSize = 14
    version.Font = Enum.Font.Gotham
    version.TextTransparency = 1
    version.Parent = bg

    local ti = TweenInfo.new(0.8, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
    TweenService:Create(logo, ti, {TextTransparency = 0}):Play()
    task.wait(0.3)
    TweenService:Create(subtitle, ti, {TextTransparency = 0}):Play()
    task.wait(0.2)
    TweenService:Create(version, ti, {TextTransparency = 0}):Play()

    task.wait(1.8)

    local to = TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.In)
    TweenService:Create(logo, to, {TextTransparency = 1}):Play()
    TweenService:Create(subtitle, to, {TextTransparency = 1}):Play()
    TweenService:Create(version, to, {TextTransparency = 1}):Play()
    TweenService:Create(bg, to, {BackgroundTransparency = 1}):Play()

    task.wait(0.7)
    introGui:Destroy()
end

playIntro()

--------------------------- GUI ---------------------------
local gui = Instance.new("ScreenGui")
gui.Name = "Hamimsfy"
gui.ResetOnSpawn = false
gui.Parent = CoreGui

local main = Instance.new("Frame")
main.Size = UDim2.new(0, 210, 0, 250)
main.Position = UDim2.new(0, 100, 0, 100)
main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 8)
corner.Parent = main

local v2Btn = Instance.new("TextButton")
v2Btn.Size = UDim2.new(0, 35, 0, 20)
v2Btn.Position = UDim2.new(0, 5, 0, 0)
v2Btn.Text = "V2"
v2Btn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
v2Btn.TextColor3 = Color3.new(1, 1, 1)
v2Btn.Font = Enum.Font.SourceSansBold
v2Btn.TextSize = 13
v2Btn.Parent = main

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -80, 0, 20)
title.Position = UDim2.new(0, 45, 0, 0)
title.BackgroundTransparency = 1
title.Text = "Hamimsfy | Mobs Only"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextSize = 14
title.Font = Enum.Font.SourceSansBold
title.Parent = main

local toggle = Instance.new("TextButton")
toggle.Size = UDim2.new(0, 190, 0, 28)
toggle.Position = UDim2.new(0, 10, 0, 28)
toggle.Text = "ON"
toggle.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
toggle.TextColor3 = Color3.new(1, 1, 1)
toggle.Font = Enum.Font.SourceSansBold
toggle.Parent = main

local sizeLabel = Instance.new("TextLabel")
sizeLabel.Size = UDim2.new(1, 0, 0, 18)
sizeLabel.Position = UDim2.new(0, 0, 0, 62)
sizeLabel.BackgroundTransparency = 1
sizeLabel.Text = "Size : " .. _G.HeadSize
sizeLabel.TextColor3 = Color3.new(1, 1, 1)
sizeLabel.TextSize = 13
sizeLabel.Parent = main

local sizePlus = Instance.new("TextButton")
sizePlus.Size = UDim2.new(0, 90, 0, 24)
sizePlus.Position = UDim2.new(0, 10, 0, 82)
sizePlus.Text = "Size +"
sizePlus.Parent = main

local sizeMinus = Instance.new("TextButton")
sizeMinus.Size = UDim2.new(0, 90, 0, 24)
sizeMinus.Position = UDim2.new(0, 110, 0, 82)
sizeMinus.Text = "Size -"
sizeMinus.Parent = main

local transLabel = Instance.new("TextLabel")
transLabel.Size = UDim2.new(1, 0, 0, 18)
transLabel.Position = UDim2.new(0, 0, 0, 112)
transLabel.BackgroundTransparency = 1
transLabel.Text = "Transparent : " .. _G.Transparency
transLabel.TextColor3 = Color3.new(1, 1, 1)
transLabel.TextSize = 13
transLabel.Parent = main

local transPlus = Instance.new("TextButton")
transPlus.Size = UDim2.new(0, 90, 0, 24)
transPlus.Position = UDim2.new(0, 10, 0, 132)
transPlus.Text = "Trans +"
transPlus.Parent = main

local transMinus = Instance.new("TextButton")
transMinus.Size = UDim2.new(0, 90, 0, 24)
transMinus.Position = UDim2.new(0, 110, 0, 132)
transMinus.Text = "Trans -"
transMinus.Parent = main

local distLabel = Instance.new("TextLabel")
distLabel.Size = UDim2.new(1, 0, 0, 18)
distLabel.Position = UDim2.new(0, 0, 0, 162)
distLabel.BackgroundTransparency = 1
distLabel.Text = "Distance : " .. _G.MaxDistance
distLabel.TextColor3 = Color3.new(1, 1, 1)
distLabel.TextSize = 13
distLabel.Parent = main

local distPlus = Instance.new("TextButton")
distPlus.Size = UDim2.new(0, 90, 0, 24)
distPlus.Position = UDim2.new(0, 10, 0, 182)
distPlus.Text = "Dist +"
distPlus.Parent = main

local distMinus = Instance.new("TextButton")
distMinus.Size = UDim2.new(0, 90, 0, 24)
distMinus.Position = UDim2.new(0, 110, 0, 182)
distMinus.Text = "Dist -"
distMinus.Parent = main

local mini = Instance.new("TextButton")
mini.Size = UDim2.new(0, 22, 0, 20)
mini.Position = UDim2.new(1, -50, 0, 0)
mini.Text = "-"
mini.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
mini.Parent = main

local close = Instance.new("TextButton")
close.Size = UDim2.new(0, 22, 0, 20)
close.Position = UDim2.new(1, -25, 0, 0)
close.Text = "X"
close.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
close.TextColor3 = Color3.new(1, 1, 1)
close.Parent = main

local icon = Instance.new("TextButton")
icon.Size = UDim2.new(0, 45, 0, 45)
icon.Position = UDim2.new(0, 100, 0, 100)
icon.Text = "H"
icon.Visible = false
icon.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
icon.TextColor3 = Color3.new(1, 1, 1)
icon.Parent = gui
icon.Active = true
icon.Draggable = true

local iconCorner = Instance.new("UICorner")
iconCorner.CornerRadius = UDim.new(0, 8)
iconCorner.Parent = icon

--------------------------- CACHING SYSTEM ---------------------------
local cachedMobs = {}          -- daftar mobs yang di-cache
local lastCacheTime = 0
local CACHE_INTERVAL = 1.5     -- update cache setiap 1.5 detik

local function updateCache()
    local newCache = {}
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("Model")
        and v:FindFirstChild("Humanoid")
        and v:FindFirstChild("HumanoidRootPart") then

            local player = Players:GetPlayerFromCharacter(v)
            if not player then
                if not (v:FindFirstChild("Friendly") or v:FindFirstChild("Ally") or v:FindFirstChild("Pet")) then
                    table.insert(newCache, v)
                end
            end
        end
    end
    cachedMobs = newCache
    lastCacheTime = tick()
end

--------------------------- FUNCTIONS ---------------------------
local function resetHitbox()
    for _, v in pairs(cachedMobs) do
        if v and v.Parent and v:FindFirstChild("HumanoidRootPart") then
            local hrp = v.HumanoidRootPart
            pcall(function()
                hrp.Size = Vector3.new(2, 2, 1)
                hrp.Transparency = 1
                hrp.Material = Enum.Material.Plastic
                hrp.CanCollide = true
                hrp.BrickColor = BrickColor.new("Medium stone grey")
            end)
        end
    end
end

local function destroyCurrent()
    _G.Enabled = false
    resetHitbox()
    if gui and gui.Parent then
        gui:Destroy()
    end
end

v2Btn.MouseButton1Click:Connect(function()
    destroyCurrent()
    task.wait(0.1)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/freedom-gun/Hitbox-mobs/main/script.lua"))()
end)

toggle.MouseButton1Click:Connect(function()
    _G.Enabled = not _G.Enabled
    if _G.Enabled then
        toggle.Text = "ON"
        toggle.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
    else
        toggle.Text = "OFF"
        toggle.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
        resetHitbox()
    end
end)

sizePlus.MouseButton1Click:Connect(function()
    _G.HeadSize = math.clamp(_G.HeadSize + 5, 5, 200)
    sizeLabel.Text = "Size : " .. _G.HeadSize
end)

sizeMinus.MouseButton1Click:Connect(function()
    _G.HeadSize = math.clamp(_G.HeadSize - 5, 5, 200)
    sizeLabel.Text = "Size : " .. _G.HeadSize
end)

transPlus.MouseButton1Click:Connect(function()
    _G.Transparency = math.clamp(_G.Transparency + 0.1, 0.1, 0.9)
    transLabel.Text = "Transparent : " .. string.format("%.1f", _G.Transparency)
end)

transMinus.MouseButton1Click:Connect(function()
    _G.Transparency = math.clamp(_G.Transparency - 0.1, 0.1, 0.9)
    transLabel.Text = "Transparent : " .. string.format("%.1f", _G.Transparency)
end)

distPlus.MouseButton1Click:Connect(function()
    _G.MaxDistance = math.clamp(_G.MaxDistance + 10, 20, 300)
    distLabel.Text = "Distance : " .. _G.MaxDistance
end)

distMinus.MouseButton1Click:Connect(function()
    _G.MaxDistance = math.clamp(_G.MaxDistance - 10, 20, 300)
    distLabel.Text = "Distance : " .. _G.MaxDistance
end)

mini.MouseButton1Click:Connect(function()
    main.Visible = false
    icon.Visible = true
end)

icon.MouseButton1Click:Connect(function()
    main.Visible = true
    icon.Visible = false
end)

close.MouseButton1Click:Connect(function()
    destroyCurrent()
end)

--------------------------- MAIN LOOP ---------------------------
-- Update cache pertama kali
updateCache()

RunService.RenderStepped:Connect(function()
    if not _G.Enabled then return end

    -- Update cache setiap 1.5 detik
    if tick() - lastCacheTime >= CACHE_INTERVAL then
        updateCache()
    end

    local character = LocalPlayer.Character
    local playerRoot = character and character:FindFirstChild("HumanoidRootPart")
    if not playerRoot then return end

    for _, v in pairs(cachedMobs) do
        if v and v.Parent then
            local humanoid = v:FindFirstChild("Humanoid")
            local hrp = v:FindFirstChild("HumanoidRootPart")

            if humanoid and hrp and humanoid.Health > 0 then
                local distance = (hrp.Position - playerRoot.Position).Magnitude

                if distance <= _G.MaxDistance then
                    if humanoid.MoveDirection.Magnitude > 0 then
                        pcall(function()
                            hrp.Size = Vector3.new(_G.HeadSize, _G.HeadSize, _G.HeadSize)
                            hrp.Transparency = _G.Transparency
                            hrp.BrickColor = BrickColor.new("Really red")
                            hrp.Material = Enum.Material.Neon
                            hrp.CanCollide = false
                        end)
                    else
                        pcall(function()
                            hrp.Transparency = 1
                        end)
                    end
                else
                    pcall(function()
                        hrp.Size = Vector3.new(2, 2, 1)
                        hrp.Transparency = 1
                        hrp.Material = Enum.Material.Plastic
                        hrp.CanCollide = true
                        hrp.BrickColor = BrickColor.new("Medium stone grey")
                    end)
                end
            end
        end
    end
end)
