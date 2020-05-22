class RecipeIngredientSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :amount, :ingredient_id, :recipe_id

  belongs_to :recipe
  belongs_to :ingredient
end
