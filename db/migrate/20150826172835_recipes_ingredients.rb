class RecipesIngredients < ActiveRecord::Migration
  def change
    create_table(:recipes_ingredients) do |t|
      t.column(:recipe_id, :int)
      t.column(:ingredient_id, :int)
      t.timestamps
    end
  end
end
