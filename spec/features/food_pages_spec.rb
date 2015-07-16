require 'rails_helper'

describe 'the add new food process' do
  it 'will add a new food to the database', js: true do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit foods_path
    click_on 'Add food'
    fill_in 'Name', :with => 'Powder'
    fill_in 'Calories', :with => 400
    click_on 'Create Food'
    expect(page).to have_content 'Powder'
  end
end
