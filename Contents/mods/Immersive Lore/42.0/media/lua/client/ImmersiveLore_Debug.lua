local ImmersiveLoreTables = require("ImmersiveLore_Tables")
local SharedUtils = require("ImmersiveLore_SharedUtils")

if not isDebugEnabled() then return end
local ImmersiveLoreDebug = {}

-- Require the ISInventoryPaneContextMenu script
require "ISInventoryPaneContextMenu"

-- FOR DEBUGGING. IRRELEVANT AS LONG AS DEV MODE IS FALSE
-- ==================================================================================================================

-- Function that rerolls the story IN ANY ROOM for an item and updates its name and UI
function ImmersiveLoreDebug.reRollAnyRoom(item, player)
	local character = getSpecificPlayer(player)
	local story = SharedUtils.getStory(nil, nil, character)
	item:getModData().ImmersiveLore_savedStory = story

	-- Retrieve and process story data
	local storyID = story["id"]
	local author = story["author"]
	local title = "UI_ImmersiveLore_Story_" .. storyID .. "_Title"
	local content = "UI_ImmersiveLore_Story_" .. storyID .. "_Content"

	title = getText(title)
	content = getText(content)
	content = string.gsub(content, "\\n", "\n")
	-- content = ImmersiveLoreUtils.divideText(content)

	item:setName(title)

	local myUI = ISReadStoryUI:new(0, 0, character, title, content, author)
	myUI:initialise()
	myUI:addToUIManager()
end

-- Function that rerolls the story for an item and updates its name and UI
function ImmersiveLoreDebug.reRoll(item, player)
	local character = getSpecificPlayer(player)
	local savedRoom = item:getModData().ImmersiveLore_savedRoom
	local savedLocation = item:getModData().ImmersiveLore_savedLocation

	if savedRoom == nil then
		print("----------------------------------------------------------------")
		print("ERROR: No saved Room was found in moddata. Use Reroll Any Room option instead")
		print("----------------------------------------------------------------")
		return
	end

	if savedLocation == nil then
		print("----------------------------------------------------------------")
		print("ERROR: No saved Location was found in moddata. Use Reroll Any Location option instead")
		print("----------------------------------------------------------------")
		return
	end

	print("Rerolling for room " .. savedRoom)
	local story = SharedUtils.getStory(savedRoom, character)
	item:getModData().ImmersiveLore_savedStory = story

	-- Retrieve and process story data
	local storyID = story["id"]
	local author = story["author"]
	local title = "UI_ImmersiveLore_Story_" .. storyID .. "_Title"
	local content = "UI_ImmersiveLore_Story_" .. storyID .. "_Content"

	title = getText(title)
	content = getText(content)
	content = string.gsub(content, "\\n", "\n")
	-- content = ImmersiveLoreUtils.divideText(content)

	item:setName(title)

	local myUI = ISReadStoryUI:new(0, 0, character, title, content, author)
	myUI:initialise()
	myUI:addToUIManager()
end

-- Function that prints the name of the room the player is currently in
function ImmersiveLoreDebug.onGetRoom(item, player)
	local playerObj = getSpecificPlayer(player)
	if playerObj:getSquare():getRoom() then
		print("Player's Current room: " .. playerObj:getSquare():getRoom():getName())
	end
	local savedRoom = item:getModData().ImmersiveLore_savedRoom or "None"
	print("Item's saved room: " .. savedRoom)
end

-- Function that shows a specific story based on its ID
function ImmersiveLoreDebug.getSpecificStory(item, player)
	local modal = ISTextBox:new(
		0, 0, 280, 180, "Enter a story ID", "0", nil, ImmersiveLoreDebug.getSpecificStoryClick, player,
		getSpecificPlayer(player), item
	)
	modal:initialise()
	modal:addToUIManager()
	modal.entry:focus()
end

function ImmersiveLoreDebug.getSpecificStoryClick(_, button, player, item)
	if button.internal == "OK" then
		local entryText = button.parent.entry:getText()
		if entryText and entryText ~= "" then
			-- Check if the entry is a number
			local entryNumber = tonumber(entryText)
			if entryNumber then
				-- Convert the number to an integer
				entryNumber = math.floor(entryNumber) + 1

				local myTable = ImmersiveLoreTables.storiesTable

				-- Check if the entryNumber is within valid range
				if entryNumber >= 1 and entryNumber <= #myTable then
					-- Set the name of the item to the title of the generated story.
					local storyID = myTable[entryNumber]["id"]
					local author = myTable[entryNumber]["author"]
					local title = "UI_ImmersiveLore_Story_" .. storyID .. "_Title"
					local content = "UI_ImmersiveLore_Story_" .. storyID .. "_Content"

					title = getText(title)
					item:setName(title)

					-- Refresh Inventory
					local pdata = getPlayerData(player:getPlayerNum())
					pdata.playerInventory:refreshBackpacks()
					pdata.lootInventory:refreshBackpacks()

					-- Create a new UI window to display the content of the story.
					content = getText(content)
					content = string.gsub(content, "\\n", "\n")
					-- local character = getSpecificPlayer(player)
					-- content = ImmersiveLoreUtils.divideText(content)

					local myUI = ISReadStoryUI:new(0, 0, player, title, content, author)
					myUI:initialise()
					myUI:addToUIManager()
				else
					-- The number is out of range, handle the error as needed
					print("Error: The ID is out of available stories range.")
				end
			else
				-- The entry is not a valid number, handle the error as needed
				print("Error: Entry is not a valid number.")
			end
		end
	end
end

return ImmersiveLoreDebug
-- FOR DEBUGGING. IRRELEVANT AS LONG AS DEV MODE IS FALSE
-- ==================================================================================================================
