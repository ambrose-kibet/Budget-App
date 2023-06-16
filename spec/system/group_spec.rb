require 'rails_helper'

RSpec.describe 'Group', type: :feature do
  include Devise::Test::IntegrationHelpers
  let(:user) { User.create!(name: 'apple', email: 'gramsy1@example.mail', password: '123456') }

  before do
    sign_in user
  end

  describe 'Groups ' do
    it 'should have Add group button' do
      visit "/users/#{user.id}/groups"
      expect(page).to have_content('Add Group')
    end
    it 'should navigate to new group when Addgroup is clicked ' do
      visit "/users/#{user.id}/groups"
      click_link 'Add Group'
      expect(page).to have_current_path(new_user_group_path(user))
    end
  end
  scenario 'User creates a group' do
    visit new_user_group_path(user)
    # Fill in the form fields
    fill_in 'group_name', with: 'My Group'
    fill_in 'group_icon', with: 'https://example.com/icon.png'
    # Submit the form
    click_button 'Save'
    # Add assertions to verify the desired behavior after submitting the form
    expect(page).to have_content 'Group created successfully'
    expect(page).to have_current_path(user_groups_path(user))
    expect(page).to have_content('My Group')
  end
end
