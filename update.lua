local fs = require("filesystem")

if not fs.exists("/home/lib") then
    fs.makeDirectory('/home/lib')
end

if not fs.exists("/home/bin") then
    fs.makeDirectory('/home/bin')
end

if not fs.exists("/home/backup") then
    fs.makeDirectory('/home/backup')
end

-- Backup updatge incase we break it
os.execute("rm ./backup/update.lua")
os.execute("cp ./update.lua ./backup/update.lua")

os.execute("wget -f https://raw.githubusercontent.com/stephenwilliams/OpenComputersStuff/master/update.lua ./update.lua")
os.execute("wget -f https://raw.githubusercontent.com/stephenwilliams/OpenComputersStuff/master/test.lua ./test.lua")
os.execute("wget -f https://raw.githubusercontent.com/stephenwilliams/OpenComputersStuff/master/lib/json.lua ./lib/json.lua")
os.execute("wget -f https://raw.githubusercontent.com/stephenwilliams/OpenComputersStuff/master/bin/get_inventory.lua ./bin/get_inventory.lua")

