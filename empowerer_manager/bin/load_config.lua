local fs = require("filesystem")
local json = loadfile("/usr/lib/json.lua")()

return function ()
  local contents = ""

  do
    local file = fs.open('/etc/empowerer_manager.cfg')
    local s = file:read(2048)
    while s do
      contents = contents..s
      s = file:read(2048)
    end
  end

  return json:decode(contents)
end
