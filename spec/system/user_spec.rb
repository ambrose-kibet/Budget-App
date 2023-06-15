require 'rails_helper'
require 'capybara'

RSpec.describe 'User index page:', type: :system do

  include Devise::Test::IntegrationHelpers

  describe 'sign up' do
    it 'can register with full set of user attributes' do
      visit new_user_registration_path

      find('#user_email').set('test@test.com')
      find('#user_password').set('password')
      fill_in 'user[password_confirmation]', with: "password"
      fill_in 'user[name]', with: "Jon"

      click_on "Next"

      expect(page).to have_content("CATEGORIES")
    end
  end

end