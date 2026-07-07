-- GAMEPLAY MODULE: Auto-Grab and Auto-Shoot
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local VirtualInputManager = game:GetService("VirtualInputManager")

local LocalPlayer = Players.LocalPlayer

local Gameplay = {
    AutoGrab = false,
    AutoShoot = false
}

-- Auto-Grab Gun Logic
task.spawn(function()
    while task.wait(0.5) do
        if Gameplay.AutoGrab then
            local gun = Workspace:FindFirstChild("GunDrop", true) -- Common name for dropped gun
            if gun and LocalPlayer.Character then
                LocalPlayer.Character:MoveTo(gun.Position)
            end
        end
    end
end)

-- Auto-Shoot Logic
task.spawn(function()
    while task.wait(0.2) do
        if Gameplay.AutoShoot then
            -- Logic: Identify Murderer (has Knife) and click if in range
            for _, player in pairs(Players:GetPlayers()) do
                if player.Character and player.Character:FindFirstChild("Knife") then
                    -- Triggering a simulated mouse click
                    VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, nil, 0)
                    VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, nil, 0)
                end
            end
        end
    end
end)

return Gameplay
