local computer = require("computer")
local rs = require("component").redstone

return function(side, upper, lower)
  local power = computer.energy() / computer.maxEnergy() * 100.0
  if power >= upper and rs.getOutput(side) ~= 0 then
    print("Power restored to good level. Stopping charge cycle")
    rs.setOutput(side, 0)
  elseif power <= lower and rs.getOutput(side) == 0 then
    print("Power low. Starting Charge")
    rs.setOutput(side, 15)
  end
end

