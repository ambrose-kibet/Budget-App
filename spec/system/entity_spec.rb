require 'rails_helper'
RSpec.feature 'Entity', type: :feature do
  include Devise::Test::IntegrationHelpers
  let(:user) { User.create!(name: 'apple', email: 'gramsy1@example.mail', password: '123456') }
  let(:group) { Group.create!(name: 'apple', icon: 'https://example.com/icon.png', user:) }

  before do
    sign_in user
  end

  scenario 'User creates an entity' do
    visit new_user_group_entity_path(user, group) # Assuming the form is accessed via this route

    # Fill in the form fields
    fill_in 'entity_name', with: 'My Entity'
    fill_in 'entity_amount', with: 50
    select group.name, from: 'entity_group_id'

    # Submit the form
    click_button 'Add Transaction'

    # Add assertions to verify the desired behavior after submitting the form
    expect(page).to have_content 'Transaction created successfully'
    expect(page).to have_current_path(user_group_path(user, group))
    expect(page).to have_content('My Entity')
  end
end
