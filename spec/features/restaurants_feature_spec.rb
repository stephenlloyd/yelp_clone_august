require 'rails_helper'

describe 'restaurants' do 
	context 'no restaurants have been added' do
		it 'should display a prompt to add a restaurant' do
			visit '/restaurants'
			expect(page).to have_content 'No restaurants yet'
      expect(page).to have_link 'Add a restaurant'
    end
  end
  context 'restautants have been addd' do
    before do
      Restaurant.create(name: 'KFC')
    end

    it "should display them" do
      visit '/restaurants'
      expect(page).to have_content('KFC')
      expect(page).not_to have_content('No restaurants yet')
    end
  end
end

describe "creating restaurants" do
it "prompts user to fill out a form, then displays the new restaurant" do
  visit '/restaurants'
  click_link 'Add a restaurant'
  fill_in 'Name', with: 'KFC'
  click_button 'Create Restaurant'
  expect(page).to have_content 'KFC'
  expect(current_path).to eq '/restaurants'
end
end

describe 'editing restaurants' do
  before do
      Restaurant.create(name: 'KFC')
  end
it "can allow a user to edit a restaurant" do
 visit '/restaurants'
 click_link 'Edit KFC'
 fill_in 'Name', with: 'Kentucky fried chicken'
 click_button 'Update Restaurant'
 expect(page).to have_content 'Kentucky fried chicken'
 expect(current_path).to eq '/restaurants'
end
end

describe 'deleting restaurants' do
  before do
      Restaurant.create(name: 'KFC')
  end

  it 'removes a restaurant when a user clicks a delete link' do
    visit '/restaurants'
    click_link 'Delete KFC'
    expect(page).not_to have_content 'KFC'
    expect(page).to have_content 'Restaurant deleted successfully'
  end
end

describe 'showing a restaurant' do 
  before do 
    Restaurant.create(name: "Nandos", description: "Best Nandos ever")
  end
  it "has a restaurant and it\'s description" do
    visit'/restaurants'
    click_link 'Show Nandos'
    expect(page).to have_content("Best Nandos ever")
    expect(current_path).to match(/restaurants\/\d/)
  end

  # bin/rails g migration AddDescriptionToRestaurants description:text
  # bin/rake db:migrate


end




