--[[
    Hamimsfy - Mobs Hitbox Expander
    Only works on specific game
    Intro + Clean Version
]]

--------------------------- SETTINGS ---------------------------
local ALLOWED_PLACE_ID = 70411440483149   -- PlaceId game kamu

_G.HeadSize = 50
_G.Transparency = 0.5
_G.Enabled = true
----------------------------------------------------------------

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

-- Cek PlaceId (yang benar)
if game.PlaceId ~= ALLOWED_PLACE_ID then
    local msg = Instance.new("Message")
    msg.Text = "❌ Wrong Game!\nPlaceId saat ini: " .. game.PlaceId
    msg.Parent = workspace
    task.wait(5)
    msg:Destroy()
    return
end

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
    version.Text = "v2.0  |  Only for this game"
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
main.Size = UDim2.new(0, 180, 0, 160)
main.Position = UDim2.new(0, 100, 0, 100)
main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 8)
corner.Parent = main

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 20)
title.BackgroundTransparency = 1
title.Text = "Hamimsfy | Mobs Only"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextSize = 14
title.Font = Enum.Font.SourceSansBold
title.Parent = main

local toggle = Instance.new("TextButton")
toggle.Size = UDim2.new(0, 160, 0, 25)
toggle.Position = UDim2.new(0, 10, 0, 25)
toggle.Text = "ON"
toggle.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
toggle.TextColor3 = Color3.new(1, 1, 1)
toggle.Font = Enum.Font.SourceSansBold
toggle.Parent = main

local sizeLabel = Instance.new("TextLabel")
sizeLabel.Size = UDim2.new(1, 0, 0, 15)
sizeLabel.Position = UDim2.new(0, 0, 0, 55)
sizeLabel.BackgroundTransparency = 1
sizeLabel.Text = "Size : " .. _G.HeadSize
sizeLabel.TextColor3 = Color3.new(1, 1, 1)
sizeLabel.TextSize = 13
sizeLabel.Parent = main

local sizePlus = Instance.new("TextButton")
sizePlus.Size = UDim2.new(0, 75, 0, 20)
sizePlus.Position = UDim2.new(0, 10, 0, 70)
sizePlus.Text = "Size +"
sizePlus.Parent = main

local sizeMinus = Instance.new("TextButton")
sizeMinus.Size = UDim2.new(0, 75, 0, 20)
sizeMinus.Position = UDim2.new(0, 95, 0, 70)
sizeMinus.Text = "Size -"
sizeMinus.Parent = main

local transLabel = Instance.new("TextLabel")
transLabel.Size = UDim2.new(1, 0, 0, 15)
transLabel.Position = UDim2.new(0, 0, 0, 95)
transLabel.BackgroundTransparency = 1
transLabel.Text = "Transparent : " .. _G.Transparency
transLabel.TextColor3 = Color3.new(1, 1, 1)
transLabel.TextSize = 13
transLabel.Parent = main

local transPlus = Instance.new("TextButton")
transPlus.Size = UDim2.new(0, 75, 0, 20)
transPlus.Position = UDim2.new(0, 10, 0, 110)
transPlus.Text = "Trans +"
transPlus.Parent = main

local transMinus = Instance.new("TextButton")
transMinus.Size = UDim2.new(0, 75, 0, 20)
transMinus.Position = UDim2.new(0, 95, 0, 110)
transMinus.Text = "Trans -"
transMinus.Parent = main

local mini = Instance.new("TextButton")
mini.Size = UDim2.new(0, 20, 0, 20)
mini.Position = UDim2.new(1, -45, 0, 0)
mini.Text = "-"
mini.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
mini.Parent = main

local close = Instance.new("TextButton")
close.Size = UDim2.new(0, 20, 0, 20)
close.Position = UDim2.new(1, -20, 0, 0)
close.Text = "X"
close.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
close.TextColor3 = Color3.new(1, 1, 1)
close.Parent = main

local icon = Instance.new("TextButton")
icon.Size = UDim2.new(0, 40, 0, 40)
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

--------------------------- FUNCTIONS ---------------------------
local function resetHitbox()
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") then
            local player = Players:GetPlayerFromCharacter(v)
            if not player then
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
end

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

mini.MouseButton1Click:Connect(function()
    main.Visible = false
    icon.Visible = true
end)

icon.MouseButton1Click:Connect(function()
    main.Visible = true
    icon.Visible = false
end)

close.MouseButton1Click:Connect(function()
    _G.Enabled = false
    resetHitbox()
    gui:Destroy()
end)

--------------------------- MAIN LOOP ---------------------------
RunService.RenderStepped:Connect(function()
    if not _G.Enabled then return end

    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("Model") 
        and v:FindFirstChild("Humanoid") 
        and v:FindFirstChild("HumanoidRootPart") then

            local player = Players:GetPlayerFromCharacter(v)
            if not player then
                if not (v:FindFirstChild("Friendly") or v:FindFirstChild("Ally") or v:FindFirstChild("Pet")) then
                    local humanoid = v.Humanoid
                    local hrp = v.HumanoidRootPart

                    if humanoid.Health > 0 and humanoid.MoveDirection.Magnitude > 0 then
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
                end
            end
        end
    end
end)
