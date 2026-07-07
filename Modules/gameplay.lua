-- modules/gameplay.lua: Interaction Logic
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

task.spawn(function()
    while task.wait(0.5) do
        local settings = getgenv().LinganguSettings
        
        -- 1. Auto-Grab Gun
        if settings.AutoGrab then
            local gun = Workspace:FindFirstChild("GunDrop", true)
            if gun and LocalPlayer.Character then
                LocalPlayer.Character:MoveTo(gun.Position)
            end
        end
        
        -- 2. Murderer Detection, Fling, and Auto-Shoot
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Knife") then
                
                -- Fling Logic: Apply high impulse to Murderer
                if settings.FlingMurderer and player.Character:FindFirstChild("HumanoidRootPart") then
                    local hrp = player.Character.HumanoidRootPart
                    hrp:ApplyImpulse(Vector3.new(9999, 9999, 9999))
                end
                
                -- Auto-Shoot Logic: If you hold a gun, shoot the Murderer
                if settings.AutoShoot and LocalPlayer.Character:FindFirstChild("Gun") then
                    -- This triggers a standard click event to fire the tool
                    LocalPlayer.Character.Gun:Activate() 
                end
            end
        end
    end
end)
