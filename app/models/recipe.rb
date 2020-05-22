class Recipe < ApplicationRecord
    has_many :comments
    belongs_to :user
    belongs_to :category
    has_many :recipe_ingredients, dependent: :destroy
	has_many :ingredients, through: :recipe_ingredients

    validates :name, presence: true, uniqueness: {:scope => [:user_id, :category_id]}
    validates :image, format: {with: /\.(png|jpg)\Z/i,  message: 'must be a url for gif, jpg, or png image.'}
    validates :directions, presence: true 
    validate :ingredient_names

    
end
