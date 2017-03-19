-- Standard Imports
local sides = require("sides")

-- Import internal code
dofile("/opt/empowerer_manager/init.lua")()
local get_inventory = dofile("/opt/empowerer_manager/get_inventory.lua")
local table_utils = dofile("/opt/empowerer_manager/table_utils.lua")
local load_config = dofile("/opt/empowerer_manager/load_config.lua")
local get_recipe = dofile("/opt/empowerer_manager/get_recipe.lua")
local prepare_recipe = dofile("/opt/empowerer_manager/prepare_recipe.lua")

local config = load_config()

local chestInv = get_inventory(sides.top)

local recipe = get_recipe(chestInv, config.recipes)

if recipe ~= nil then
  prepare_recipe(sides.top, sides.bottom, recipe)
else
  print("Nothing found")
end
