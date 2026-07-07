-- Modernized LinganguHub UI (with custom shadow ID)
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 200, 0, 70)
MainFrame.Position = UDim2.new(0.5, -100, 0.1, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0

-- UI Effects
local Corner = Instance.new("UICorner", MainFrame); Corner.CornerRadius = UDim.new(0, 14)
local Stroke = Instance.new("UIStroke", MainFrame); Stroke.Color = Color3.fromRGB(60, 60, 60); Stroke.Thickness = 2

-- Custom Shadow Implementation
local Shadow = Instance.new("ImageLabel", MainFrame)
Shadow.Size = UDim2.new(1, 20, 1, 20)
Shadow.Position = UDim2.new(0, -10, 0, -10)
Shadow.BackgroundTransparency = 1
Shadow.Image = "rbxassetid://15199050892" -- Your custom ID
Shadow.ImageColor3 = Color3.new(0, 0, 0)
Shadow.ImageTransparency = 0.3
Shadow.ZIndex = 0

-- Button
local ToggleBtn = Instance.new("TextButton", MainFrame)
ToggleBtn.Size = UDim2.new(0.9, 0, 0.6, 0); ToggleBtn.Position = UDim2.new(0.05, 0, 0.2, 0)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45); ToggleBtn.Text = "ESP: OFF"; ToggleBtn.TextColor3 = Color3.new(1,1,1)
ToggleBtn.Font = Enum.Font.GothamBold; ToggleBtn.TextSize = 18; Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(0, 8)

-- Hover Effects
ToggleBtn.MouseEnter:Connect(function()
    TweenService:Create(ToggleBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(60, 60, 60)}):Play()
end)
ToggleBtn.MouseLeave:Connect(function()
    TweenService:Create(ToggleBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(45, 45, 45)}):Play()
end)

-- Dragging Logic
local dragging, dragStart, startPos
MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true; dragStart = input.Position; startPos = MainFrame.Position
    end
end)
UIS.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then dragging = false end
end)

-- Toggle Logic
ToggleBtn.MouseButton1Click:Connect(function()
    getgenv().ESP_Enabled = not getgenv().ESP_Enabled
    ToggleBtn.Text = getgenv().ESP_Enabled and "ESP: ON" or "ESP: OFF"
    local targetColor = getgenv().ESP_Enabled and Color3.fromRGB(0, 180, 80) or Color3.fromRGB(45, 45, 45)
    TweenService:Create(ToggleBtn, TweenInfo.new(0.3), {BackgroundColor3 = targetColor}):Play()
end)
