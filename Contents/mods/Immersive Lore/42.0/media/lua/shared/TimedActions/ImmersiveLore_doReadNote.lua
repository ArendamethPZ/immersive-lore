require "TimedActions/ISBaseTimedAction"
local SharedUtils = require("ImmersiveLore_SharedUtils")

ImmersiveLore_doReadNote = ISBaseTimedAction:derive("ImmersiveLore_doReadNote")

function ImmersiveLore_doReadNote:isValid() -- Check if the action can be done
    if not self.item then return false end
    if self.item:getContainer() ~= self.character:getInventory() then return false end
    return true
end

function ImmersiveLore_doReadNote:update() -- Trigger every game update when the action is being performed
end

function ImmersiveLore_doReadNote:waitToStart() -- Wait until false is returned
    return false
end

function ImmersiveLore_doReadNote:start() -- Trigger when the action starts
end

function ImmersiveLore_doReadNote:stop() -- Trigger if the action is cancelled
    ISBaseTimedAction.stop(self)
end

function ImmersiveLore_doReadNote:perform() -- Trigger when the action is complete
    -- If there is no saved story data, generate a new story based on the room where the item was found.
    local story

    if not SharedUtils.getSavedStory(self.item) then
        if isDebugEnabled() then
            print("NO MOD DATA FOUND. SETTING NEW.")
        end

        story = SharedUtils.generateNewStory(self.item, self.character)
    else
        -- Retrieve the saved story for the item.
        story = self.item:getModData().ImmersiveLore_savedStory
    end

    -- Retrieve story data
    local storyID = story["id"]

    -- For Debugging
    if isDebugEnabled() then
        print("SHOWING STORY ID " .. storyID)
    end

    local author = story["author"]
    local title = "UI_ImmersiveLore_Story_" .. storyID .. "_Title"
    title = getText(title)
    local content = "UI_ImmersiveLore_Story_" .. storyID .. "_Content"
    content = getText(content)

    self.item:setName(title)

    -- Refresh Inventory
    local pdata = getPlayerData(self.player)
    pdata.playerInventory:refreshBackpacks()
    pdata.lootInventory:refreshBackpacks()

    content = string.gsub(content, "\\n", "\n")

    -- Create a new UI window to display the content of the saved story.
    local myUI = ISReadStoryUI:new(0, 0, self.character, title, content, author)
    myUI:initialise()
    myUI:addToUIManager()

    SharedUtils.addStoryToSeenStories(self.character, story)

    ISBaseTimedAction.perform(self)
end

function ImmersiveLore_doReadNote:complete() -- Trigger when the action is complete
    return true
end

function ImmersiveLore_doReadNote:new(character, item) -- What to call in the code
    local o = ISBaseTimedAction.new(self, character)
    o.player = character:getIndex()
    o.item = item
    o.maxTime = 48 * 0.1 -- Time taken by the action (48 per 1 second)
    if o.character:isTimedActionInstant() then o.maxTime = 1 end
    return o
end
