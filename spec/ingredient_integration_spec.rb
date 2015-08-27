require 'spec_helper'

describe 'create ingredient path', {type: :feature} do
  it 'adds an ingredient to a specific recipe' do
    recipe = Recipe.create({:name => 'Burrito'})
    ingredient = Ingredient.create({:name => 'Avocado'})
    visit "/recipe/#{recipe.id}"
    fill_in 'ingredient' , with: 'Avocado'
    click_button 'Add'
    expect(page).to have_content 'Avocado'
  end

  it 'shows ingredient page' do
    recipe = Recipe.create({:name => 'Burrito'})
    visit "/recipe/#{recipe.id}"
    ingredient = Ingredient.create({:name => 'Avocado'})
    click_link 'Avocado'
    visit "/ingredient/#{ingredient.id}"
    expect(page).to have_content 'Avocado'
  end

end
