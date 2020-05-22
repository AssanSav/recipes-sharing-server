class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :email, :id

  has_many :recipes 
  has_many :categories 
end
