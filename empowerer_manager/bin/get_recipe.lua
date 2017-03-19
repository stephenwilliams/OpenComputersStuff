return function  (chestInv, recipes)
  for _,recipe in pairs(recipes) do
    print("Checking recipe: "..recipe.name)
    if table_utils.containsTable(chestInv, recipe.items) then
      return recipes
    end
  end
  return nil
end
