local fs = require("filesystem")
local internet = require("internet")

return function ()
  if not fs.exists("/usr/lib/json.lua") or not loadfile("/usr/lib/json.lua") then
    if not fs.exists("/usr/lib") then
      fs.makeDirectory("/usr/lib")
    end
    local f = io.open("/usr/lib/json.lua", "w")
    for chunk in internet.request("http://regex.info/code/JSON.lua") do
      f:write(chunk)
    end
    f:close()
  end
end
