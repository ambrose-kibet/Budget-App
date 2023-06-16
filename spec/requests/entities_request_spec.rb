require 'rails_helper'

RSpec.describe 'Entities', type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create!(name: 'apple', email: 'gramsy1@example.mail', password: '123456') }
  let(:group) { Group.create!(name: 'apple', icon: 'https://img.icons8.com/?size=512&id=FMPXwiWsNx4v&format=png', user:) }
  let(:entity) { Entity.create!(name: 'apple', amount: 10, user:) }

  before do
    sign_in user
  end

  describe 'GET /new' do
    it 'should successfully request for new group form' do
      get "/users/#{user.id}/groups/#{group.id}/entities/new"
      expect(response).to be_successful
      expect(response.status).to eq(200)
    end

    it 'should successfully render new template' do
      get "/users/#{user.id}/groups/#{group.id}/entities/new"
      expect(response).to render_template(:new)
    end
    it 'check the response body includes correct text' do
      get "/users/#{user.id}/groups/#{group.id}/entities/new"
      expect(response.body).to include("<h4 class='title'>CREATE TRANSACTION</h4>")
    end
  end
end
