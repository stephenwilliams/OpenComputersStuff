-- Standard Imports
local sides = require("sides")
local rs = require("component").redstone

-- Import internal code
dofile("/opt/empowerer_manager/init.lua")()
local get_inventory = dofile("/opt/empowerer_manager/get_inventory.lua")
local table_utils = dofile("/opt/empowerer_manager/table_utils.lua")
local load_config = dofile("/opt/empowerer_manager/load_config.lua")
local get_recipe = dofile("/opt/empowerer_manager/get_recipe.lua")
local prepare_recipe = dofile("/opt/empowerer_manager/prepare_recipe.lua")
local check_power = dofile("/opt/empowerer_manager/check_power.lua")

local config = load_config()

function canTick()
  if rs.getInput(config.inProgress) > 0 then
    print("Currently empowering")
    return false
  end
  return true
end


function tick()
  check_power(sides[config.power], config.powerUpper, config.powerLower)

  if canTick() then
    local chestInv = get_inventory(sides[config.source])

    local recipe = get_recipe(chestInv, config.recipes)

    if recipe ~= nil then
      prepare_recipe(sides[config.source], sides[config.destination], recipe)
    else
      print("Nothing found")
    end
  end
end

print("Starting Empowerer Manager")

while true do
  tick()
  os.sleep(config.sleep)
end
