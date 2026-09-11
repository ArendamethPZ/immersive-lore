local ImmersiveLoreUtils = require("ImmersiveLore_Utils")
local ImmersiveLoreDebug = require("ImmersiveLore_Debug")
local LIF = require("LIF")

-- Require the ISInventoryPaneContextMenu script
require "ISInventoryPaneContextMenu"

-- Used for debugging and development. Returns true if player is in debug mode
local devMode = isDebugEnabled()

-- Function that creates a context menu for a list of items
local function createMenu(player, context, items)
	-- Iterate over the items and add a context menu option for each one
	for i, v in ipairs(items) do
		local item = v

		if not instanceof(v, "InventoryItem") then
			item = v.items[1]
		end

		local character = getSpecificPlayer(player)

		-- Only add context menu options for items belonging to the ImmersiveLore mod
		if item:getModID() == "ImmersiveLore" then
			context:addOption("Read", item, ImmersiveLoreUtils.onRead, character)
			if devMode then
				-- The following options will only appear if dev mode is set to true
				context:addOption("DEBUG: Reroll", item, ImmersiveLoreDebug.reRoll, player)
				context:addOption("DEBUG: Reroll Any Room", item, ImmersiveLoreDebug.reRollAnyRoom, player)
				context:addOption("DEBUG: Get Room", item, ImmersiveLoreDebug.onGetRoom, player)
				context:addOption("DEBUG: Get Specific Story", item, ImmersiveLoreDebug.getSpecificStory, player)
			end
		end
	end
end

--- Function that saves the item's spawn room when its filled in a container
---@param roomName      string
---@param containerType string
---@param itemContainer ItemContainer
local function OnFillContainer(roomName, containerType, itemContainer)
	if not itemContainer then return end

	local items = itemContainer:getItems()
	if not items then return end

	for i = 0, items:size() - 1 do
		local item = items:get(i)
		if item:getType() == "TatteredPaper" then
			item:getModData().ImmersiveLore_savedRoom = roomName
			if not roomName then
				item:getModData().ImmersiveLore_savedRoom = containerType
			end

			local parent = itemContainer:getParent()
			if parent then
				local x, y = parent:getX(), parent:getY()
				item:getModData().ImmersiveLore_savedLocation = LIF.getLocation(x, y) or {}
			end
		end
	end
end

Events.OnFillContainer.Add(OnFillContainer)
Events.OnFillInventoryObjectContextMenu.Add(createMenu)
