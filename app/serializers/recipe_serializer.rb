class RecipeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :image, :directions, :user_id, :category_id

  has_many :ingredients
  
  attribute :username do |object| 
    object.user.username
  end

  attribute :category_name do |object|
    object.category.name
  end

  attribute :ingredients do |object| 
    object.ingredients
  end
end
