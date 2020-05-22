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

    before_validation :name_capitalizer
    

    def recipe_ingredients_attributes=(recipe_ingredients_hash)
		recipe_ingredients_hash.values.each do |recipe_ingredient|
			recipe = Recipe.find_by(id: recipe_ingredient[:recipe_id])
			rec_ingredient = RecipeIngredient.find_by(id: recipe_ingredient[:id])
			ingredient = Ingredient.find_by(id: recipe_ingredient[:ingredient_attributes][:id])
            if recipe && rec_ingredient && ingredient
                rec_ingredient.update(amount: recipe_ingredient[:amount])
				ingredient.update(name: recipe_ingredient[:ingredient_attributes][:name])
			else
				self.recipe_ingredients.build(recipe_ingredient)
			end
		end
    end
    
    
end
