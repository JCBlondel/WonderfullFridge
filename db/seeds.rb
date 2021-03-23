require 'json'

json_file = File.read('./recipes.json')
json_hash = JSON.parse(json_file)

recipes = []
ingredients = []
quantities = []

json_hash.each do |recipe|
  recipe_data = {
    name: recipe["name"],
    difficulty: recipe["difficulty"],
    preparation_time: recipe["prep_time"],
    cook_time: recipe["cook_time"],
    description: recipe["ingredients"].join("\n")
  }
  recipes << recipe_data

  recipe["ingredients"].each do |ingredient|
    ingredient_data = {
      name: ingredient
    }
    ingredients << ingredient_data
  end
end

ingredients = ingredients.uniq

ActiveRecord::Base.transaction do
  puts "Recipes : #{Time.now}"
  Recipe.insert_all(recipes)
  puts "Ingredients : #{Time.now}"
  Ingredient.insert_all(ingredients)
end

puts "Searching recipe/ingredients : #{Time.now}"

json_hash.each do |recipe|
  recipe_id = Recipe.find_by(name: recipe["name"]).id
  if recipe_id
    ingredient_ids = Ingredient.where(name: recipe["ingredients"]).pluck(:id)
    ingredient_ids.each do |ingredient_id|
      quantities << {
        recipe_id: recipe_id,
        ingredient_id: ingredient_id
      }
    end
  else
    puts "DB: did not found #{recipe["name"]}"
  end
end

puts "Quantities : #{Time.now}"
Quantity.insert_all(quantities)
puts "Finish : #{Time.now}"
