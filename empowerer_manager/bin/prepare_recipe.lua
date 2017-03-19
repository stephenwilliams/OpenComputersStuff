local inv = require("component").inventory_controller
local table_utils = dofile("/opt/empowerer_manager/table_utils.lua")

function getItemStack(side, itemLabel)
  local maxSlots = inv.getInventorySize(side)
  for slot=1, maxSlots do
    local stack = inv.getStackInSlot(side, slot)
    if stack ~= nil and stack.label == itemLabel then
      local result = {}
      result.stack = stack
      result.slot = slot
      return result
    end
  end
end

function getDestinationSlot(side, itemLabel, size)
  local maxSlots = inv.getInventorySize(side)
  for slot=1, maxSlots do
    local stack = inv.getStackInSlot(side, slot)
    if stack == nil then
      return slot
    elseif stack ~= nil and stack.itemLabel == itemLabel and (stack.size + size) <= stack.maxSize then
      return slot
    end
  end
  return nil
end

function moveItemStack(source, destination, sourceSlot, itemLabel, amount)
  inv.suckFromSlot(source, sourceSlot, amount)
  local destSlot = getDestinationSlot(destination, itemLabel, amount)
  inv.dropIntoSlot(destination, destSlot, amount)
end

return function (source, destination, recipe)
  print("Preparing recipe :"..recipe.name)
  for item, amount in pairs(recipe.items) do
    print("Moving "..amount.." of '"..item.."'")
    local amountLeft = amount
    while amountLeft ~= 0 do
      local slotInfo = getItemStack(source, item)
      local stack = slotInfo.stack

      if stack.size >= amountLeft then
        moveItemStack(source, destination, slotInfo.slot, item, amountLeft)
        amountLeft = 0
      else
        amountLeft = amountLeft - stack.size
        moveItemStack(source, destination, slotInfo.slot, item, stack.size)
      end
    end
  end
end
