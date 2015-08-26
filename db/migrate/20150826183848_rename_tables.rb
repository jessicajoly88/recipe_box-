class RenameTables < ActiveRecord::Migration
  def change
    rename_table :recipes_categories, :categories_recipes
    rename_table :recipes_ingredients, :ingredients_recipes
  end
end
