local inv = require("component").inventory_controller

return function(side)
  for slot=1,inv.getInventorySize(side) do
    local stack = inv.getStackInSlot(side, slot)
    print(stack.name)
  end
end
