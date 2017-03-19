-- Standard Imports
local sides = require("sides")

-- Import internal code
dofile("/opt/empowerer_manager/init.lua")()
local get_inventory = dofile("/opt/empowerer_manager/get_inventory.lua")
local table_utils = dofile("/opt/empowerer_manager/table_utils.lua")
local load_config = dofile("/opt/empowerer_manager/load_config.lua")

local config = load_config()

local chestInv = get_inventory(sides.top)

for recipe in config.recipes do
  print("Checking recipe: "..recipe.name)
  print(table_utils.containsTable(chestInv, recipe.items))
end
