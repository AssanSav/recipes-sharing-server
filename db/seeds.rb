# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Api.request["meals"].each do |attr|
    # user = User.find_by(id: 1)
    category = Category.find_or_create_by(id: attr["idMeal"], user_id: 2, name: attr["strCategory"])
    recipe = Recipe.find_or_create_by(category_id: category.id, user_id: 2, name: attr["strMeal"], image: attr["strMealThumb"], directions: attr["strInstructions"])
    20.times do |index|
        if attr["strIngredient#{index + 1}"] !="" && attr["strMeasure#{index + 1}"] !=""
            ingredient = Ingredient.find_or_create_by(name: attr["strIngredient#{index + 1}"]) 
            recipe_ingredients = RecipeIngredient.create(recipe_id: recipe.id, ingredient_id: ingredient.id, amount: attr["strMeasure#{index + 1}"])
        end
    end
end