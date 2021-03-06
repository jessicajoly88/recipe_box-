require 'spec_helper'

describe 'create recipe path', {type: :feature} do
  it 'goes to recipes page and shows all recipes' do
    visit '/'
    click_link 'View All Recipes'
    expect(page).to have_content 'There are no recipes yet'
  end

  it 'adds a new recipe to the database' do
    visit '/'
    fill_in 'name', with: 'Burrito'
    click_button 'Submit'
    expect(page).to have_content 'Burrito'
  end

  it 'allows user to view a specific recipe and its details ' do
    recipe = Recipe.create({name: 'Burrito'})
    visit '/recipes'
    click_link 'Burrito'
    expect(page).to have_content 'Burrito'
  end

  it 'allows a user to delete a recipe' do
    recipe = Recipe.create({name: 'Burrito'})
    visit '/recipes'
    click_button 'Delete'
    expect(page).not_to have_content 'Burrito'
  end

  it 'allows a user to update a recipe'do
    recipe = Recipe.create({name: 'Burrito'})
    visit "/recipe/#{recipe.id()}"
    fill_in 'name', with:"Enchiladas"
    click_button 'Update'
    expect(page).to have_content 'Enchiladas'
  end
end
