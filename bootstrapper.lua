-- BOOTSTRAPPER: Load LinganguHub
local REPO_URL = "https://raw.githubusercontent.com/Scribble513/LinganguHub/main/"

-- Initialize Shared Environment
getgenv().LinganguSettings = {
    ESP_Enabled = false,
    AutoGrab = false,
    AutoShoot = false
}

-- Load Modules
loadstring(game:HttpGet(REPO_URL .. "modules/esp.lua"))()
loadstring(game:HttpGet(REPO_URL .. "modules/gameplay.lua"))()
loadstring(game:HttpGet(REPO_URL .. "main.lua"))()
