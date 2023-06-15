require 'rails_helper'

RSpec.describe "Homes", type: :system do
     it 'Should redirect to user sign up page' do
      visit '/'
      click_link "Sign Up"
      expect(page).to have_current_path(new_user_registration_path)
    end
    
end