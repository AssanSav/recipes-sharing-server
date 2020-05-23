class Recipe < ApplicationRecord
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
    
    def ingredients 
        self.recipe_ingredients.map do |rec_ingr|
            if rec_ingr.recipe_id == self.id 
                {
                    id: rec_ingr.ingredient.id,
                    name: rec_ingr.ingredient.name,
                    amount: rec_ingr.amount
                }
            end
        end
    end


    def ingredient_names 
		self.recipe_ingredients.map(&:ingredient_id)
		if ingredient_ids != ingredient_ids.uniq
			self.errors.add(:recipe_ingredients, "Ingredient Name Should Appear Once!")
		end
    end
  
    def name_capitalizer
        self.name = self.name.capitalize
    end
end
