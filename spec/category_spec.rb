require 'spec_helper'

describe Category do
  describe('#recipes') do
    it('tells which recipes are in a category') do
      test_category = Category.create({:name => 'mexican'})
      test_recipe = Recipe.create({:name=> "Breakfast Burrito", :instruction => "Eat burrito", :category_ids => [test_category.id()]})
      test_recipe2 = Recipe.create({:name=> "Lunch Tacos", :instruction => "Eat tacos", :category_ids => [test_category.id()]})
      expect(test_category.recipes()).to(eq([test_recipe, test_recipe2]))
    end
  end
end
