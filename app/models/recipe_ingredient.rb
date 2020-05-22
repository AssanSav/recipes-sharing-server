class RecipeIngredient < ApplicationRecord
    belongs_to :recipe
    belongs_to :ingredient

    validates :amount, presence: true
    validates_uniqueness_of :ingredient_id, scope: :recipe_id

     def ingredient_name=(name) 
        self.ingredient = Ingredient.find_or_create_by(name: name)
    end

    def ingredient_name 
        self.ingredient.try(:name)
    end
end
