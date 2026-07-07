-- modules/esp.lua: Logic
local Players = game:GetService("Players")

task.spawn(function()
    while task.wait(1) do
        if getgenv().LinganguSettings.ESP_Enabled then
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= Players.LocalPlayer and player.Character then
                    -- Role Detection Logic
                    local char = player.Character
                    local role = (char:FindFirstChild("Knife") and "Murderer") or 
                                 (char:FindFirstChild("Gun") and "Sheriff") or "Innocent"
                    
                    print(player.Name .. " is " .. role)
                    -- Apply your Highlight or Drawing code here using the 'role' variable
                end
            end
        end
    end
end)
