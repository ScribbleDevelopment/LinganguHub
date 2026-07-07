-- main.lua: UI and Settings Controller
-- Ensure the settings table exists before creating UI
repeat task.wait() until getgenv().LinganguSettings ~= nil

local LinganguHub = Instance.new("ScreenGui", game.CoreGui)
LinganguHub.Name = "LinganguHub"

local MainFrame = Instance.new("Frame", LinganguHub)
MainFrame.Size = UDim2.new(0, 200, 0, 300)
MainFrame.Position = UDim2.new(0.1, 0, 0.1, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
MainFrame.Active = true
MainFrame.Draggable = true

local Title = Instance.new("TextLabel", MainFrame)
Title.Text = "LinganguHub"
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Title.TextColor3 = Color3.new(1, 1, 1)

local function createToggle(name, settingKey)
    local btn = Instance.new("TextButton", MainFrame)
    btn.Text = name
    btn.Size = UDim2.new(0.9, 0, 0, 40)
    btn.Position = UDim2.new(0.05, 0, 0, (#MainFrame:GetChildren() - 1) * 50)
    btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    
    -- Sync initial button state with current setting
    btn.BackgroundColor3 = getgenv().LinganguSettings[settingKey] and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(60, 60, 60)
    
    btn.MouseButton1Click:Connect(function()
        getgenv().LinganguSettings[settingKey] = not getgenv().LinganguSettings[settingKey]
        local enabled = getgenv().LinganguSettings[settingKey]
        btn.BackgroundColor3 = enabled and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(60, 60, 60)
    end)
end

-- Create Buttons
createToggle("ESP", "ESP_Enabled")
createToggle("Auto Grab", "AutoGrab")
createToggle("Auto Shoot", "AutoShoot")
createToggle("Fling Murd", "FlingMurderer")
