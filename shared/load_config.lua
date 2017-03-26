local fs = require("filesystem")
local json = loadfile("/usr/lib/json.lua")()
local json_init = require("json_init")

json_init()

return function (config)
  local contents = ""

  do
    local file = fs.open(config)
    local s = file:read(2048)
    while s do
      contents = contents..s
      s = file:read(2048)
    end
  end

  return json:decode(contents)
end
