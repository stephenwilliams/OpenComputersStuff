local shell = require("shell")
local fs = require("filesystem")

if !fs.exists("./lib") then
    fs.makeDirectory('./lib')
end

if !fs.exists("./bin") then
    fs.makeDirectory('./bin')
end

shell.execute("wget -fq https://raw.githubusercontent.com/stephenwilliams/OpenComputersStuff/master/update.lua ./update.lua")
shell.execute("wget -fq https://raw.githubusercontent.com/stephenwilliams/OpenComputersStuff/master/lib/json.lua ./lib/json.lua")
shell.execute("wget -fq https://raw.githubusercontent.com/stephenwilliams/OpenComputersStuff/master/bin/get_inventory.lua ./bin/get_inventory.lua")

