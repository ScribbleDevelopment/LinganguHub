-- BOOTSTRAPPER: Reliable Load Order
local REPO_URL = "https://raw.githubusercontent.com/YOUR_USERNAME/LinganguHub/main/"

-- 1. Initialize Shared Environment
getgenv().LinganguSettings = {
    ESP_Enabled = false,
    AutoGrab = false,
    AutoShoot = false,
    FlingMurderer = false
}

-- 2. Helper to load modules after a small delay
local function safeLoad(path)
    local success, result = pcall(function()
        return loadstring(game:HttpGet(REPO_URL .. path))()
    end)
    if not success then warn("Error loading " .. path .. ": " .. tostring(result)) end
end

-- 3. Load in strict order
safeLoad("main.lua")
task.wait(0.5) -- Wait for UI to exist
safeLoad("modules/esp.lua")
safeLoad("modules/gameplay.lua")
