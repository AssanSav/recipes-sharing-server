# User.create(username: "test user", email: "test_user@exemple.com", user_id: 1)

Api.request["meals"].each do |attr|
    category = Category.find_or_create_by(id: attr["idMeal"], user_id: 1, name: attr["strCategory"])
    recipe = Recipe.find_or_create_by(category_id: category.id, user_id: 1, name: attr["strMeal"], image: attr["strMealThumb"], directions: attr["strInstructions"])
    
    20.times do |index|
        if attr["strIngredient#{index + 1}"] !="" && attr["strMeasure#{index + 1}"] !=""
            ingredient = Ingredient.find_or_create_by(name: attr["strIngredient#{index + 1}"]) 
            recipe_ingredients = RecipeIngredient.find_or_create_by(recipe_id: recipe.id, ingredient_id: ingredient.id, amount: attr["strMeasure#{index + 1}"])
        end
    end
end