local shell = require("shell")
local rs = require("component").redstone
local colors = require("colors")
local sides = require("sides")

local load_config = require("load_config")

local args, ops = shell.parse(...)
local config = require("/etc/mob_grinder.cfg")

local bundle = sides[config["bundle"]]

-- FUNCTIONS

function getSpawner(mob)
  for _,spawner in pairs(config.spawners) do
    if (string.lower(spawner.name) == string.lower(mob)) then
      return spawner
    end
  end

  return nil
end

function toggleSpawner(mob)
  local spawner = getSpawner(mob)

  if (spawner == nil) then
    print("Mob not found")
    return
  end

  local spawnerColor = colors[spawner["color"]]

  if (rs.getBundledOutput(bundle, spawnerColor) > 0) then
    rs.setBundledOutput(bundle, spawnerColor, 0)
    print("Turned spawner '"..spawner.name.."' off")
  else
    rs.setBundledOutput(bundle, spawnerColor, 15)
    print("Turned spawner '"..spawner.name.."' on")
  end
end

-- END FUNCTIONS

if (table.getn(args) <= 0) then
  print("No args")
  return
end

if (args[1] == "spawn" and table.getn(args) == 2) then
  toggleSpawner(args[2])
end


