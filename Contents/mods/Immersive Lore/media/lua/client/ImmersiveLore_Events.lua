local ImmersiveLoreTables = require("ImmersiveLore_Tables")

-- Helper to split a string by a delimiter
local function splitString(inputStr, sep)
    local t = {}
    for str in string.gmatch(inputStr, "([^" .. sep .. "]+)") do
        table.insert(t, str)
    end
    return t
end

-- Helper to trim whitespace from strings
local function trim(s)
    return s:match("^%s*(.-)%s*$")
end

-- Event function to initialize blacklist filtering
local function onInitGlobalModData()
    local blacklistString = SandboxVars.ImmersiveLore.BlacklistedStories or ""
    local blacklist = {}

    -- Build a set of trimmed blacklisted IDs
    for _, id in ipairs(splitString(blacklistString, ";")) do
        local trimmedId = trim(id)
        blacklist[trimmedId] = true
    end

    -- Ensure ActivatedStories exists
    ImmersiveLoreTables.ActivatedStories = ImmersiveLoreTables.ActivatedStories or {}

    -- Filter out blacklisted stories
    for _, story in ipairs(ImmersiveLoreTables.storiesTable or {}) do
        if not blacklist[tostring(story.id)] then
            table.insert(ImmersiveLoreTables.ActivatedStories, story)
        end
    end
end

Events.OnInitGlobalModData.Add(onInitGlobalModData)


-- local function OnCreatePlayer(_, character)
--     if not character:isLocalPlayer() then return end
--     local myUI = ImmersiveLore_UpdateNotification:new(0, 0, character)
--     myUI:initialise();
--     myUI:addToUIManager();
-- end
-- Events.OnCreatePlayer.Add(OnCreatePlayer)
