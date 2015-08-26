class CreateRecipesCategories < ActiveRecord::Migration
  def change
    create_table(:recipes_categories) do |t|
      t.column(:recipe_id, :int)
      t.column(:category_id, :int)
      t.timestamps
    end
  end
end
