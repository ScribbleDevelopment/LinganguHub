-- ESP MODULE: Persistent Role Detection
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local function getRole(player)
    local char = player.Character
    local back = player.Backpack
    
    -- Check for Murderer or Sheriff items
    if (char and char:FindFirstChild("Knife")) or (back and back:FindFirstChild("Knife")) then
        return "Murderer"
    elseif (char and char:FindFirstChild("Gun")) or (back and back:FindFirstChild("Gun")) then
        return "Sheriff"
    else
        return "Innocent"
    end
end

-- Persistent Loop
task.spawn(function()
    while task.wait(1) do -- Updates every second to save performance
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= Players.LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local role = getRole(player)
                local color = Color3.fromRGB(0, 255, 0) -- Green for Innocent
                
                if role == "Murderer" then
                    color = Color3.fromRGB(255, 0, 0) -- Red
                elseif role == "Sheriff" then
                    color = Color3.fromRGB(0, 0, 255) -- Blue
                end
                
                -- Assuming you use a Highlight or Drawing library for the visuals
                -- Here is where you apply the 'color' variable to your ESP object
                print(player.Name .. " is " .. role) -- Replace with your drawing function
            end
        end
    end
end)
