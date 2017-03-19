function containsRecipe(inv, items)
  for item, amount in pairs(items) do
    if not contains(inv, item) then
      return false
    end

    if inv[item] < amount then
      return false
    end
  end
  return true
end

return function  (chestInv, recipes)
  for _,recipe in pairs(recipes) do
    print("Checking recipe: "..recipe.name)
    if containsRecipe(chestInv, recipe.items) then
      print("Found recipe: "..recipe.name)
      return recipe
    end
  end
  return nil
end
