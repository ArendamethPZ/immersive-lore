local ImmersiveLoreTables = require("ImmersiveLore_Tables")
local SharedUtils = {}

function SharedUtils.getSavedStory(item)
    return item:getModData().ImmersiveLore_savedStory or nil
end

function SharedUtils.generateNewStory(item, character)
    -- Check the item's current saved room
    local savedRoom = item:getModData().ImmersiveLore_savedRoom
    local savedLocation = item:getModData().ImmersiveLore_savedLocation or {}
    -- If there's no saved room, we check if the item spawned on a zombie, and save that as a room
    if not savedRoom then
        if item:getContainer() and item:getContainer():getType() == "inventorymale" or "inventoryfemale" then
            item:getModData().ImmersiveLore_savedRoom = item:getContainer():getType()
        end
    end

    local story = SharedUtils.getStory(savedRoom, savedLocation, character)

    -- Save the generated story for the item.
    item:getModData().ImmersiveLore_savedStory = story

    return story
end

--- Adds the story to player's seen stories
---@param character IsoPlayer
---@param story     table
function SharedUtils.addStoryToSeenStories(character, story)
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
    local unseenStories = SharedUtils.getUnseenStories(character)

    -- If there are no unseen stories, reset the seen stories tracker
    if #unseenStories == 0 then
        print("----------------------------------------------------------------")
        print("All stories have been seen. Resetting seen stories tracker.")
        print("----------------------------------------------------------------")
        moddata.ImmersiveLore_seenStories = {}
    end
    character:transmitModData()
end

---@param savedRoom     string
---@param savedLocation table
---@param character     IsoPlayer
---@return table
function SharedUtils.getStory(savedRoom, savedLocation, character)
    local activatedStories = ImmersiveLoreTables.ActivatedStories
    local filteredStories = {}
    local unseenStories = SharedUtils.getUnseenStories(character)

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

function SharedUtils.getUnseenStories(character)
    -- Retrieve the full stories table
    local activatedStories = ImmersiveLoreTables.ActivatedStories

    -- Get the mod data for this character and extract the 'seenStories' dictionary if it exists
    local seenStories = SharedUtils.getSeenStories(character)

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

function SharedUtils.getSeenStories(character)
    return character:getModData().ImmersiveLore_seenStories or {}
end

return SharedUtils
