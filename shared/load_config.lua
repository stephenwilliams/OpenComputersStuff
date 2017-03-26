local fs = require("filesystem")
local json = loadfile("/usr/lib/json.lua")()
local json_init = require("json_init")

json_init()

return function (config)
  local file = fs.open(config)
  return json:decode(file:read("a*"))
end
