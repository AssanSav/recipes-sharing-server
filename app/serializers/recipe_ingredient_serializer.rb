class RecipeIngredientSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :ingredient_name, :amount, :ingredient_id, :recipe_id
end
