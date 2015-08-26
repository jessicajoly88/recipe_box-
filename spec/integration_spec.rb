require 'spec_helper'

describe 'create recipe path', {type: :feature} do
  it 'goes to recipes page and shows all recipes' do
    visit '/'
    click_link 'View All Recipes'
    expect(page).to have_content 'There are no recipes yet'
  end
end
