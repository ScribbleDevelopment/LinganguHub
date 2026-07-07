-- modules/gameplay.lua: Interaction Logic
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")

task.spawn(function()
    while task.wait(0.5) do
        if getgenv().LinganguSettings.AutoGrab then
            local gun = Workspace:FindFirstChild("GunDrop", true)
            if gun and Players.LocalPlayer.Character then
                Players.LocalPlayer.Character:MoveTo(gun.Position)
            end
        end
        
        if getgenv().LinganguSettings.AutoShoot then
            for _, p in pairs(Players:GetPlayers()) do
                if p.Character and p.Character:FindFirstChild("Knife") then
                    -- Trigger shooting logic
                end
            end
        end
    end
end)
