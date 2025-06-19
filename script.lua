-- Roblox Lua Script: Engaging Loading Screen for 'Grow a Garden'
-- Prevents user input and keeps the screen occupied

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create screen GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "LoadingScreen"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.Parent = playerGui

-- Fullscreen frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(1, 0, 1, 0)
mainFrame.Position = UDim2.new(0, 0, 0, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
mainFrame.Parent = screenGui

-- Prevent input
mainFrame.Active = true
mainFrame.Selectable = false
mainFrame.ZIndex = 10

-- Title Text
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0.2, 0)
title.Position = UDim2.new(0, 0, 0.1, 0)
title.BackgroundTransparency = 1
title.Text = "Preparing Rayfield Please Wait 5-10 Minutes"
title.Font = Enum.Font.GothamBlack
title.TextScaled = true
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Parent = mainFrame

-- Loading text
local loadingText = Instance.new("TextLabel")
loadingText.Size = UDim2.new(1, 0, 0.1, 0)
loadingText.Position = UDim2.new(0, 0, 0.3, 0)
loadingText.BackgroundTransparency = 1
loadingText.Text = "Initializing..."
loadingText.Font = Enum.Font.GothamSemibold
loadingText.TextScaled = true
loadingText.TextColor3 = Color3.fromRGB(200, 200, 200)
loadingText.Parent = mainFrame

-- Loading bar background
local barBackground = Instance.new("Frame")
barBackground.Size = UDim2.new(0.8, 0, 0.05, 0)
barBackground.Position = UDim2.new(0.1, 0, 0.5, 0)
barBackground.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
barBackground.BorderSizePixel = 0
barBackground.Parent = mainFrame

-- Loading bar
local bar = Instance.new("Frame")
bar.Size = UDim2.new(0, 0, 1, 0)
bar.Position = UDim2.new(0, 0, 0, 0)
bar.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
bar.BorderSizePixel = 0
bar.Parent = barBackground

-- Tween the bar to full over 20 minutes (1200 seconds)
local goal = {}
goal.Size = UDim2.new(1, 0, 1, 0)

local tweenInfo = TweenInfo.new(1200, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
local tween = TweenService:Create(bar, tweenInfo, goal)
tween:Play()

-- Keep screen locked for 20 minutes
wait(1200)

-- Remove GUI after loading
screenGui:Destroy()
-- Enable game elements or teleport player to the main area here
