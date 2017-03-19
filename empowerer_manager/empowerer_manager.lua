-- Standard Imports
local sides = require("sides")

-- Import internal code
dofile("/opt/empowerer_manager/init.lua")()
local get_inventory = dofile("/opt/empowerer_manager/get_inventory.lua")

get_inventory(sides.top)
