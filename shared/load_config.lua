local fs = require("filesystem")
local json = loadfile("/usr/lib/json.lua")()

dofile("/opt/shared/json_init.lua")()

return function (config)
  local file = fs.open(config)
  return json:decode(file:read("a*"))
end
