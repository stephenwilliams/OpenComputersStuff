local fs = require("filesystem")
local json = loadfile("/usr/lib/json.lua")()

return function ()
  local file = fs.open('/etc/empowerer_manager.cfg')
  return json:decode(file:read("a*"))
end
