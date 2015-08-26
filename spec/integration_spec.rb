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
    @recipe = Recipe.create({name: 'Burrito'})
    visit '/recipes'
    click_link 'Burrito'
    expect(page).to have_content 'Burrito'
  end

end
