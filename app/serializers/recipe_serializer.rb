class RecipeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :image, :directions, :user_id, :category_id
  
  belongs_to :user
  belongs_to :category
end
