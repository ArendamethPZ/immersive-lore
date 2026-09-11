local ImmersiveLoreTables = require("ImmersiveLore_Tables")
local ImmersiveLoreUtils = {}

--- Prepares player for reading the tattered paper action
---@param character IsoPlayer
---@param note      InventoryItem
function ImmersiveLoreUtils.getReadyForReadingAction(character, note)
    if isForceDropHeavyItem(character:getPrimaryHandItem()) then
        ISTimedActionQueue.add(ISUnequipAction:new(character, character:getPrimaryHandItem(), 50))
    end

    ISInventoryPaneContextMenu.transferIfNeeded(character, note)

    -- Too obnoxious to keep swapping out currently equipped item to read the note?
    -- ISTimedActionQueue.add(ISEquipWeaponAction:new(character, note, 10, false, false))
end

--- Checks if the given storyId exists in the player's seen stories
---@param character IsoPlayer
---@param storyId   string | number
---@return boolean
function ImmersiveLoreUtils.isStorySeen(character, storyId)
    storyId = tostring(storyId)
    local moddata = character:getModData()

    -- Retrieve the seenStories dictionary
    local seenStories = moddata.ImmersiveLore_seenStories or {}

    -- Return true if the storyId exists in the dictionary, false otherwise
    return seenStories[storyId] == true
end

-- Function that reads the story for an item, either loading it from mod data or generating a new one
---@param item      InventoryItem
---@param character IsoPlayer
function ImmersiveLoreUtils.onRead(item, character)
    ImmersiveLoreUtils.getReadyForReadingAction(character, item)
    ISTimedActionQueue.add(ImmersiveLore_doReadNote:new(character, item))
end

-- This function randomly censors a single word,
-- keeping 'keepPercent' of its letters and
-- replacing the rest with random symbols
-- (ensuring we don't repeat the same symbol twice in a row).
function ImmersiveLoreUtils.censorWord(word, keepPercent)
    local CENSOR_SYMBOLS = ImmersiveLoreTables.censorSymbols
    local len = #word
    if len == 0 or keepPercent <= 0 then
        -- If word is empty or we keep 0%, everything is replaced with random symbols
        local censoredChars = {}
        local prevSymbol = nil
        for i = 1, len do
            local replacement
            repeat
                replacement = CENSOR_SYMBOLS[1 + ZombRand(#CENSOR_SYMBOLS)]
            until replacement ~= prevSymbol
            censoredChars[i] = replacement
            prevSymbol = replacement
        end
        return table.concat(censoredChars)
    elseif keepPercent >= 1 then
        -- If we keep 100% of the letters, no censorship
        return word
    end

    -- Number of letters to keep (rounded)
    local keepCount = math.floor(len * keepPercent + 0.5)
    if keepCount == 0 then
        keepCount = 1
    end

    -- Build an array of indices [1..len]
    local indices = {}
    for i = 1, len do
        indices[i] = i
    end

    -- Shuffle this array to pick random positions
    for i = len, 2, -1 do
        local j = 1 + ZombRand(i)
        indices[i], indices[j] = indices[j], indices[i]
    end

    -- We'll create a lookup for which positions should remain visible
    local keepPositions = {}
    for i = 1, keepCount do
        keepPositions[indices[i]] = true
    end

    -- Rebuild the word
    local censoredChars = {}
    local prevSymbol = nil -- track last used symbol so it doesn't repeat
    for i = 1, len do
        if keepPositions[i] then
            -- Keep the original letter
            censoredChars[i] = word:sub(i, i)
            prevSymbol = nil -- reset so next censored char can be anything
        else
            local replacement
            repeat
                replacement = CENSOR_SYMBOLS[1 + ZombRand(#CENSOR_SYMBOLS)]
            until replacement ~= prevSymbol
            censoredChars[i] = replacement
            prevSymbol = replacement
        end
    end

    return table.concat(censoredChars)
end

-- Escapes magic characters in a word for a Lua pattern
function ImmersiveLoreUtils.escapeForPattern(str)
    -- Lua pattern special characters: ^$()%.[]*+-?)
    -- We can escape them by using % in front of each
    return str:gsub("([%^%$%(%)%%%.%[%]%*%+%-%?])", "%%%1")
end

function ImmersiveLoreUtils.censorContent(content)
    -- Adjust this to your desired keep percentage (0.1 = 10%, 0 = all censored, etc.)
    local keepPercent = 0.1

    content = content:gsub("([^%s]+)", function (token)
        local leadPunc = token:match("^[%p%c]+") or ""
        local trailPunc = token:match("[%p%c]+$") or ""
        local core = token:match("^[%p%c]*(.-)[%p%c]*$") or token

        -- Convert the core to lowercase once
        local coreLower = core:lower()

        for _, forbiddenWord in ipairs(ImmersiveLoreTables.badWords) do
            local forbiddenLower = forbiddenWord:lower()

            -- Check if the core matches the forbidden word, or the forbidden word + "s"
            if coreLower == forbiddenLower or coreLower == forbiddenLower .. "s" then
                core = ImmersiveLoreUtils.censorWord(core, keepPercent)
                break
            end
        end

        return leadPunc .. core .. trailPunc
    end)

    return content
end

return ImmersiveLoreUtils
