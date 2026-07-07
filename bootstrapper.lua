local REPO_URL = "https://raw.githubusercontent.com/ScribbleDevelopment/LinganguHub/main/"

local function loadModule(name)
    local success, response = pcall(function()
        return game:HttpGet(REPO_URL .. "modules/" .. name .. ".lua")
    end)
    if success then loadstring(response)() end
end

-- Load your hub main and then specific MM2 modules
loadstring(game:HttpGet(REPO_URL .. "main.lua"))()
loadModule("esp")
loadModule("gameplay")
