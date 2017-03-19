local table_utils = dofile("/opt/empowerer_manager/table_utils.lua")

return function  (chestInv, recipes)
  for _,recipe in pairs(recipes) do
    print("Checking recipe: "..recipe.name)
    if table_utils.containsTable(chestInv, recipe.items) then
      return recipe
    end
  end
  return nil
end
