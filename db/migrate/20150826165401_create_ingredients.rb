class CreateIngredients < ActiveRecord::Migration
  def change
    create_table(:ingredients) do |t|
      t.column :name, :string
      t.column :recipe_id, :int
      t.timestamps
    end
  end
end
