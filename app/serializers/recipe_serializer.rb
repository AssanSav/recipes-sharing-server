class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :directions, :user_id, :category_id
end
