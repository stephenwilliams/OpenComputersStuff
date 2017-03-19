local inv = require("component").inventory_component

return function(side)
  for slot=1,inv.getInventorySize(side) do
    local stack = inv.getStackInSlock(side, slot)
    print(stack.name)
  end
end
