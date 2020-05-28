class CategorySerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :user_id, :list_recipes
  
  attributes :list_recipes do |object|
    object.recipes
  end
end
