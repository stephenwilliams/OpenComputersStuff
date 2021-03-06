local inv = require("component").inventory_controller
local table_utils = dofile("/opt/empowerer_manager/table_utils.lua")

return function(side)
  local result = {}
  for slot=1,inv.getInventorySize(side) do
    local stack = inv.getStackInSlot(side, slot)
    if stack ~= nil then
      if table_utils.contains(result, stack.label) then
        result[stack.label] = result[stack.label] + stack.size
      else
        result[stack.label] = stack.size
      end
    end
  end
  return result
end
