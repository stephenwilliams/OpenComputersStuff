local shell = require("shell")
local rs = require("component").redstone
local colors = require("colors")
local sides = require("sides")

local load_config = require("load_config")

local args, ops = shell.parse(...)
local config = load_config("/etc/mob_grinder.cfg")

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
    print("Turned spawner '"..spawner.name.."' off")
  else
    rs.setBundledOutput(bundle, spawnerColor, 15)
    print("Turned spawner '"..spawner.name.."' on")
  end
end

function listSpawners()
  for _,spawner in pairs(config.spawners) do
    print(spawner.name)
  end
end

function toggleLights()
  if (rs.getBundledOutput(bundle, colors[config["lights"]]) > 0) then
    print("Turned lights off")
  else
    rs.setBundledOutput(bundle, colors[config["lights"]], 15)
    print("Turned lights on")
  end
end

function toggleGrinder()
  if (rs.getBundledOutput(bundle, colors[config["grinder"]]) > 0) then
    print("Turned grinder off")
  else
    rs.setBundledOutput(bundle, colors[config["grinder"]], 15)
    print("Turned grinder on")
  end
end

-- END FUNCTIONS

if (table.getn(args) <= 0) then
  print("Mob Grinder CLI")
  print("---------------")
  print("spawn mob")
  print("list")
  print("grinder")
  print("lights")
  return
end

if (args[1] == "spawn" and table.getn(args) == 2) then
  toggleSpawner(args[2])
elseif (args[1] == "spawn" and table.getn(args) ~= 2)
  print("Usage is spawn <mob>")
elseif (args[1] == "list") then
  listSpawners()
elseif (args[1] == "grinder") then
  toggleGrinder()
elseif (args[1] == "lights") then
  toggleLights()
end


