class RecipeIngredientSerializer < ActiveModel::Serializer
  attributes :id, :amount, :ingredient_id, :recipe_id
end
