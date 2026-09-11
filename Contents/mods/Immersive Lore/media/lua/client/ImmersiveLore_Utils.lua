local ImmersiveLoreUtils = {}
local ImmersiveLoreTables = require("ImmersiveLore_Tables")

---Prepares player for reading the tattered paper action
---@param character IsoPlayer
---@param note InventoryItem
function ImmersiveLoreUtils.getReadyForReadingAction(character, note)
    if isForceDropHeavyItem(character:getPrimaryHandItem()) then
        ISTimedActionQueue.add(ISUnequipAction:new(character, character:getPrimaryHandItem(), 50));
    end

    ISInventoryPaneContextMenu.transferIfNeeded(character, note)

    -- Too obnoxious to keep swapping out currently equipped item to read the note?
    --ISTimedActionQueue.add(ISEquipWeaponAction:new(character, note, 10, false, false))
end

---Adds the story to player's seen stories
---@param character IsoPlayer
---@param story table
function ImmersiveLoreUtils.addStoryToSeenStories(character, story)
    local storyId = story.id
    local moddata = character:getModData()

    -- Initialize seenStories as a dictionary if it's not already
    local seenStories = moddata.ImmersiveLore_seenStories or {}

    -- Check if the storyId is already in the seenStories dictionary
    if seenStories[storyId] then
        return -- Story already seen, exit the function
    end

    -- Mark the story as seen
    seenStories[storyId] = true
    moddata.ImmersiveLore_seenStories = seenStories

    -- Check the number of unseen stories
    local unseenStories = ImmersiveLoreUtils.getUnseenStories(character)

    -- If there are no unseen stories, reset the seen stories tracker
    if #unseenStories == 0 then
        print("----------------------------------------------------------------")
        print("All stories have been seen. Resetting seen stories tracker.")
        print("----------------------------------------------------------------")
        moddata.ImmersiveLore_seenStories = {}
    end
end

--- Checks if the given storyId exists in the player's seen stories
---@param character IsoPlayer
---@param storyId string|number
---@return boolean
function ImmersiveLoreUtils.isStorySeen(character, storyId)
    local storyId = tostring(storyId)
    local moddata = character:getModData()

    -- Retrieve the seenStories dictionary
    local seenStories = moddata.ImmersiveLore_seenStories or {}

    -- Return true if the storyId exists in the dictionary, false otherwise
    return seenStories[storyId] == true
end

-- Function that reads the story for an item, either loading it from mod data or generating a new one
---@param item InventoryItem
---@param character IsoPlayer
function ImmersiveLoreUtils.onRead(item, character)
    local playerNum = character:getPlayerNum()
    ImmersiveLoreUtils.getReadyForReadingAction(character, item)
    ISTimedActionQueue.add(ImmersiveLore_doReadNote:new(playerNum, item)) -- Clean the gun
end

---@param savedRoom string
---@param savedLocation table
---@param character IsoPlayer
---@return table
function ImmersiveLoreUtils.getStory(savedRoom, savedLocation, character)
    local activatedStories = ImmersiveLoreTables.ActivatedStories
    local filteredStories = {}
    local unseenStories = ImmersiveLoreUtils.getUnseenStories(character)

    if savedRoom ~= nil and savedLocation ~= nil and savedLocation.id ~= nil then
        for i = 1, #unseenStories do
            local story = unseenStories[i]
            local passesRoom = true
            local passesLocation = true

            -- Room check (pass if no rooms defined, otherwise must match)
            if story.rooms and #story.rooms > 0 then
                passesRoom = false
                for j = 1, #story.rooms do
                    if story.rooms[j] == savedRoom then
                        passesRoom = true
                        break
                    end
                end
            end

            -- Location check (pass if no locations defined, otherwise must match)
            if story.locations and #story.locations > 0 then
                passesLocation = false
                for j = 1, #story.locations do
                    if story.locations[j] == savedLocation.id then
                        passesLocation = true
                        break
                    end
                end
            end

            if passesRoom and passesLocation then
                table.insert(filteredStories, story)
            end
        end
    else
        if isDebugEnabled() then
            print("----------------------------------------------------------------")
            print("WARNING: Missing filter(s). Selecting randomly from all.")
            print("----------------------------------------------------------------")
        end
        filteredStories = unseenStories
    end

    -- Choose a random story from filtered list, or fallback
    local selectedStory
    if #filteredStories > 0 then
        selectedStory = filteredStories[1 + ZombRand(#filteredStories)]
    else
        -- No available story matches the current room and location filters, so we choose randomly from all
        print("----------------------------------------------------------------")
        print("WARNING: No story was found for the filtered room and location")
        print("----------------------------------------------------------------")
        selectedStory = unseenStories[1 + ZombRand(#activatedStories)]
    end

    return selectedStory
end

function ImmersiveLoreUtils.getSavedStory(item)
    return item:getModData().ImmersiveLore_savedStory or nil
end

function ImmersiveLoreUtils.getSeenStories(character)
    return character:getModData().ImmersiveLore_seenStories or {}
end

function ImmersiveLoreUtils.getUnseenStories(character)
    -- Retrieve the full stories table
    local activatedStories = ImmersiveLoreTables.ActivatedStories

    -- Get the mod data for this character and extract the 'seenStories' dictionary if it exists
    local seenStories = ImmersiveLoreUtils.getSeenStories(character)

    -- Initialize an empty table for unseen stories
    local unseenStories = {}

    -- Loop through every story in the global table
    for i = 1, #activatedStories do
        local story = activatedStories[i]

        -- If this story is *not* seen by the character, add it to the unseenStories table
        if not seenStories[story.id] then
            table.insert(unseenStories, story)
        end
    end

    return unseenStories or {}
end

function ImmersiveLoreUtils.generateNewStory(item, character)
    -- Check the item's current saved room
    local savedRoom = item:getModData().ImmersiveLore_savedRoom
    local savedLocation = item:getModData().ImmersiveLore_savedLocation or {}
    -- If there's no saved room, we check if the item spawned on a zombie, and save that as a room
    if not savedRoom then
        if item:getContainer() and item:getContainer():getType() == "inventorymale" or "inventoryfemale" then
            item:getModData().ImmersiveLore_savedRoom = item:getContainer():getType()
        end
    end

    local story = ImmersiveLoreUtils.getStory(savedRoom, savedLocation, character)

    -- Save the generated story for the item.
    item:getModData().ImmersiveLore_savedStory = story

    return story
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

    content = content:gsub("([^%s]+)", function(token)
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
