class CreateRecipes < ActiveRecord::Migration
  def change
    create_table(:recipes) do |t|
      t.column :name, :string
      t.column :instruction, :string
      t.column :category_id, :integer
      t.column :ingredient_id, :integer
      t.column :rating, :integer
      t.timestamps
    end
  end
end
