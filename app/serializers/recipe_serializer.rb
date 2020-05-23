class RecipeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :image, :directions, :user_id, :category_id
  
  attribute :username do |object| 
    object.user.username
  end

  attribute :category_name do |object|
    object.category.name
  end
end
