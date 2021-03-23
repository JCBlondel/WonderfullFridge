class Api::V1::RecipesController < Api::V1::ApiController
  def search
    ingredients = params[:ingredients].split(' ')
    ingredients.map! { |word| "%#{word}%" }

    recipes = Recipe.where(Recipe.arel_table[:description].matches_all(ingredients))

    render json: recipes
  end
end
