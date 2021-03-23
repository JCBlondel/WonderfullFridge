class CreateRecipesIngredientsQuantities < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes, id: :uuid do |t|
      t.string :name, null: false
      t.string :difficulty, null: false
      t.string :preparation_time, null: false
      t.string :cook_time, null: false
      t.string :description, null: false
    end

    create_table :ingredients, id: :uuid do |t|
      t.string :name, null: false
    end

    create_table :quantities, id: :uuid do |t|
    end

    add_reference :quantities, :recipe, null: false, type: :uuid
    add_reference :quantities, :ingredient, null: false, type: :uuid
  end
end
