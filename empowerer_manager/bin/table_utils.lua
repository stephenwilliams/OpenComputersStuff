local M = {}

function contains(set, key)
  return set[key] ~= nil
end

function containsTable(set, table)
  for key,  val in pairs(table) do
    if not contains(set, key) then
      return false
    end

    if set[key] ~= val then
      return false
    end
  end
  return true
end

-- https://stackoverflow.com/a/32660766
function equals(o1, o2, ignore_mt)
  if o1 == o2 then return true end
  local o1Type = type(o1)
  local o2Type = type(o2)
  if o1Type ~= o2Type then return false end
  if o1Type ~= 'table' then return false end

  if not ignore_mt then
    local mt1 = getmetatable(o1)
    if mt1 and mt1.__eq then
      --compare using built in method
      return o1 == o2
    end
  end

  local keySet = {}

  for key1, value1 in pairs(o1) do
    local value2 = o2[key1]
    if value2 == nil or equals(value1, value2, ignore_mt) == false then
      return false
    end
    keySet[key1] = true
  end

  for key2, _ in pairs(o2) do
    if not keySet[key2] then return false end
  end
  return true
end

-- https://github.com/robmiracle/print_r/blob/master/print_r.lua
function print_r ( t )
  local print_r_cache={}
  local function sub_print_r(t,indent)
    if (print_r_cache[tostring(t)]) then
      print(indent.."*"..tostring(t))
    else
      print_r_cache[tostring(t)]=true
      if (type(t)=="table") then
        for pos,val in pairs(t) do
          if (type(val)=="table") then
            print(indent.."["..pos.."] => "..tostring(t).." {")
            sub_print_r(val,indent..string.rep(" ",string.len(pos)+8))
            print(indent..string.rep(" ",string.len(pos)+6).."}")
          elseif (type(val)=="string") then
            print(indent.."["..pos..'] => "'..val..'"')
          else
            print(indent.."["..pos.."] => "..tostring(val))
          end
        end
      else
        print(indent..tostring(t))
      end
    end
  end
  if (type(t)=="table") then
    print(tostring(t).." {")
    sub_print_r(t,"  ")
    print("}")
  else
    sub_print_r(t,"  ")
  end
  print()
end

M.contains = contains
M.equals = equals
M.print = print_r
M.containsTable = containsTable

return M
