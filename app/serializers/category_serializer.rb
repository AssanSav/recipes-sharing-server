class CategorySerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :user_id
  
  has_many :recipes
end
