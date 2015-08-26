require('spec_helper')

describe(Ingredient) do
  describe('#recipes') do
    it('tells which recipes have a specific ingredient') do
      test_ingredient = Ingredient.create({:name => 'cilantro'})
      test_recipe = Recipe.create({:name=> "Breakfast Burrito", :instruction => "Eat burrito", :ingredient_ids => [test_ingredient.id()]})
      test_recipe2 = Recipe.create({:name=> "Lunch Tacos", :instruction => "Eat tacos", :ingredient_ids => [test_ingredient.id()]})
      expect(test_ingredient.recipes()).to(eq([test_recipe, test_recipe2]))
   end
  end
end
