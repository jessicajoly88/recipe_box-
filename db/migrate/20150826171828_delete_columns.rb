class DeleteColumns < ActiveRecord::Migration
  def change
    remove_column(:recipes, :category_id, :integer)
    remove_column(:recipes, :ingredient_id, :integer)
    remove_column(:recipes, :rating, :integer)
    remove_column(:categories, :recipe_id, :integer)
    remove_column(:ingredients, :recipe_id, :integer)
  end
end
