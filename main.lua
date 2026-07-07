-- main.lua: UI and Settings
local LinganguHub = Instance.new("ScreenGui", game.CoreGui)
local MainFrame = Instance.new("Frame", LinganguHub)
MainFrame.Size = UDim2.new(0, 200, 0, 300)
MainFrame.Position = UDim2.new(0.1, 0, 0.1, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
MainFrame.Active = true
MainFrame.Draggable = true

local function createToggle(name, settingKey)
    local btn = Instance.new("TextButton", MainFrame)
    btn.Text = name
    btn.Size = UDim2.new(0.9, 0, 0, 40)
    btn.Position = UDim2.new(0.05, 0, 0, #MainFrame:GetChildren() * 50)
    btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    
    btn.MouseButton1Click:Connect(function()
        getgenv().LinganguSettings[settingKey] = not getgenv().LinganguSettings[settingKey]
        local enabled = getgenv().LinganguSettings[settingKey]
        btn.BackgroundColor3 = enabled and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(60, 60, 60)
    end)
end

createToggle("ESP", "ESP_Enabled")
createToggle("Auto Grab", "AutoGrab")
createToggle("Auto Shoot", "AutoShoot")
