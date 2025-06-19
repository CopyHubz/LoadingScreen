local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer

pcall(function()
    local existing = CoreGui:FindFirstChild("RayfieldLoader")
    if existing then existing:Destroy() end
end)

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "RayfieldLoader"
screenGui.IgnoreGuiInset = true
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
screenGui.Parent = CoreGui

-- Background Frame
local background = Instance.new("Frame")
background.Size = UDim2.new(1,0,1,0)
background.Position = UDim2.new(0,0,0,0)
background.BackgroundColor3 = Color3.fromRGB(5,5,15)
background.ZIndex = 0
background.Parent = screenGui

-- Neon glowing grid overlay (using multiple thin frames)
local function createGridLine(isHorizontal, position)
    local line = Instance.new("Frame")
    if isHorizontal then
        line.Size = UDim2.new(1, 0, 0, 2)
        line.Position = UDim2.new(0, 0, position, 0)
    else
        line.Size = UDim2.new(0, 2, 1, 0)
        line.Position = UDim2.new(position, 0, 0, 0)
    end
    line.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
    line.BorderSizePixel = 0
    line.BackgroundTransparency = 0.85
    line.ZIndex = 1
    line.Parent = background
    
    -- Glow effect (neon) with Tween
    local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
    local tween = TweenService:Create(line, tweenInfo, {BackgroundTransparency = 0.5})
    tween:Play()
    
    return line
end

-- Create grid lines every 0.1 in scale
for i = 0, 1, 0.1 do
    createGridLine(true, i)  -- Horizontal
    createGridLine(false, i) -- Vertical
end

-- Animated neon lines moving across screen
local neonLine = Instance.new("Frame")
neonLine.Size = UDim2.new(0, 3, 1, 0)
neonLine.Position = UDim2.new(-0.03, 0, 0, 0)
neonLine.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
neonLine.BorderSizePixel = 0
neonLine.ZIndex = 2
neonLine.BackgroundTransparency = 0.4
neonLine.Parent = background

TweenService:Create(neonLine, TweenInfo.new(5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1, true), {Position = UDim2.new(1, 0, 0, 0)}):Play()

-- Main UI frame (above background)
local blackout = Instance.new("Frame")
blackout.Size = UDim2.new(1, 0, 1, 0)
blackout.Position = UDim2.new(0, 0, 0, 0)
blackout.BackgroundTransparency = 1
blackout.ZIndex = 10000
blackout.Active = true
blackout.Parent = screenGui

-- Main title with glow effect
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0.1, 0)
title.Position = UDim2.new(0, 0, 0.05, 0)
title.BackgroundTransparency = 1
title.Text = "Preparing Rayfield - Please Wait 5-10 Minutes"
title.TextColor3 = Color3.fromRGB(0, 255, 255)
title.Font = Enum.Font.GothamBlack
title.TextScaled = true
title.ZIndex = 10001
title.Parent = blackout

-- Glow effect for title
local function pulseGlow(guiObject)
    spawn(function()
        while true do
            TweenService:Create(guiObject, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {TextColor3 = Color3.fromRGB(0, 180, 255)}):Play()
            wait(1.5)
            TweenService:Create(guiObject, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {TextColor3 = Color3.fromRGB(0, 255, 255)}):Play()
            wait(1.5)
        end
    end)
end
pulseGlow(title)

-- Subtext messages
local subtext = Instance.new("TextLabel")
subtext.Size = UDim2.new(1, 0, 0.05, 0)
subtext.Position = UDim2.new(0, 0, 0.15, 0)
subtext.BackgroundTransparency = 1
subtext.Text = "Initializing modules..."
subtext.TextColor3 = Color3.fromRGB(150, 230, 255)
subtext.Font = Enum.Font.GothamMedium
subtext.TextScaled = true
subtext.ZIndex = 10001
subtext.Parent = blackout

local messages = {
    "// Bypassing server-side detection...",
    "// Spoofing client-side variables...",
    "// Disabling remote event logs...",
    "// Injecting stealth payload...",
    "// Encrypting local hooks...",
    "// Obfuscating script identifiers...",
    "// Establishing secure tunnel...",
    "// Finalizing bypass stack..."
}

spawn(function()
    while true do
        for _, msg in ipairs(messages) do
            subtext.Text = msg
            wait(5)
        end
    end
end)

-- Loading bar background with glow
local barBG = Instance.new("Frame")
barBG.Size = UDim2.new(0.7, 0, 0.04, 0)
barBG.Position = UDim2.new(0.15, 0, 0.5, 0)
barBG.BackgroundColor3 = Color3.fromRGB(0, 30, 40)
barBG.BorderSizePixel = 0
barBG.ZIndex = 10001
barBG.Parent = blackout

local uiStroke = Instance.new("UIStroke")
uiStroke.Color = Color3.fromRGB(0, 255, 255)
uiStroke.Thickness = 2
uiStroke.Parent = barBG

local bar = Instance.new("Frame")
bar.Size = UDim2.new(0, 0, 1, 0)
bar.Position = UDim2.new(0, 0, 0, 0)
bar.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
bar.BorderSizePixel = 0
bar.ZIndex = 10002
bar.Parent = barBG

local barGlow = Instance.new("UIGradient")
barGlow.Color = ColorSequence.new(Color3.fromRGB(0, 255, 255), Color3.fromRGB(0, 150, 255))
barGlow.Rotation = 90
barGlow.Parent = bar

local barShine = Instance.new("Frame")
barShine.Size = UDim2.new(0.15, 0, 1.4, 0)
barShine.Position = UDim2.new(-0.15, 0, -0.2, 0)
barShine.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
barShine.BackgroundTransparency = 0.7
barShine.Rotation = 30
barShine.ZIndex = 10003
barShine.Parent = bar

local shineTween = TweenService:Create(barShine, TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1, true), {Position = UDim2.new(1, 0, -0.2, 0)})
shineTween:Play()

-- Percentage label
local percentText = Instance.new("TextLabel")
percentText.Size = UDim2.new(1, 0, 0.04, 0)
percentText.Position = UDim2.new(0, 0, 0.55, 0)
percentText.BackgroundTransparency = 1
percentText.Text = "Progress: 0%"
percentText.TextColor3 = Color3.fromRGB(0, 255, 255)
percentText.Font = Enum.Font.GothamMedium
percentText.TextScaled = true
percentText.ZIndex = 10001
percentText.Parent = blackout

-- Tween bar over 20 minutes (1200s)
local duration = 1200
local startTime = tick()
local barTween = TweenService:Create(bar, TweenInfo.new(duration, Enum.EasingStyle.Linear), {Size = UDim2.new(1, 0, 1, 0)})
barTween:Play()

-- Update percentage
spawn(function()
    while true do
        local elapsed = math.min(tick() - startTime, duration)
        local pct = math.floor((elapsed / duration) * 100)
        percentText.Text = "Progress: " .. tostring(pct) .. "%"
        wait(1)
    end
end)

-- Bottom warning
local warning = Instance.new("TextLabel")
warning.Size = UDim2.new(1, 0, 0.05, 0)
warning.Position = UDim2.new(0, 0, 0.93, 0)
warning.BackgroundTransparency = 1
warning.Text = "If you leave during the process, your data will be scattered and ruined."
warning.TextColor3 = Color3.fromRGB(255, 100, 100)
warning.Font = Enum.Font.GothamBold
warning.TextScaled = true
warning.ZIndex = 10001
warning.Parent = blackout

-- Full lock for 20 mins
wait(duration)
screenGui:Destroy()
