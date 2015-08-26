require 'spec_helper'

describe(Recipe) do
  describe('#ingredients') do
    it 'shows all the ingredients that belong to a recipe' do
      test_recipe = Recipe.create({:name => 'Burrito', :instruction => 'Microwave it'})
      test_ingredient1= Ingredient.create({:name => 'Cilantro', :recipe_ids => [test_recipe.id()]})
      expect(test_recipe.ingredients()).to(eq([test_ingredient1]))
    end
  end

  describe('#categories') do
    it 'shows all the categories that the recipe belongs to' do
      test_recipe = Recipe.create({:name => 'Burrito', :instruction => 'Microwave it'})
      test_category = Category.create({:name => 'Breakfast', :recipe_ids => [test_recipe.id()]})
      expect(test_recipe.categories()).to(eq([test_category]))
    end
  end

  describe('#capitalize') do
    it 'capitalizes the recipe name' do
      test_recipe = Recipe.create({:name => 'burrito', :instruction => 'Microwave it'})
      expect(test_recipe.name()).to(eq("Burrito"))
    end
  end

  describe('#validates') do
    it 'validates presence of name in name field' do
      test_recipe = Recipe.create({:name => "", :instruction => 'Microwave it'})
      expect(test_recipe.save()).to(eq(false))
    end
  end
end
