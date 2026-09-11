local LIF = require("LIF")

local function getOverallCondition(vehicle)
    local generalCondition = 0
    local totalPart = 0
    for i = 1, vehicle:getPartCount() do
        local part = vehicle:getPartByIndex(i - 1)
        local cond = part:getCondition()
        -- if we removed the item, condition should be 0
        if part:getItemType() and not part:getItemType():isEmpty() and not part:getInventoryItem() then
            cond = 0
        end
        generalCondition = generalCondition + cond
        totalPart = totalPart + 1
    end
    generalCondition = round(generalCondition / totalPart, 2)
    return generalCondition
end

-- This function makes sure that the TatteredPaper item spawns only in vehicles which have an overall condition of 50 or less
local function onVehicleFillContainer(roomName, containerType, itemContainer)
    if not itemContainer then return end

    local vehicle = itemContainer:getParent()
    local threshold = 100

    if instanceof(vehicle, "BaseVehicle") then
        local itemsToRemove = {}

        for i = 0, itemContainer:getItems():size() - 1 do
            local item = itemContainer:getItems():get(i)
            if item:getType() == "TatteredPaper" then
                local vehicleCondition = getOverallCondition(vehicle)
                if vehicleCondition > threshold then
                    table.insert(itemsToRemove, item)
                else
                    item:getModData().ImmersiveLore_savedRoom = string.lower(itemContainer:getType())
                    local x, y = vehicle:getX(), vehicle:getY()
                    item:getModData().ImmersiveLore_savedLocation = LIF.getLocation(x, y) or {}
                end
            end
        end

        if #itemsToRemove > 0 then
            for _, item in ipairs(itemsToRemove) do
                itemContainer:Remove(item)
            end
        end
    end
end

Events.OnFillContainer.Add(onVehicleFillContainer)
