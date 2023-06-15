require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe 'GET /index' do
    it 'should successfully request for inventories' do
      get "/"
      expect(response).to be_successful
      expect(response.status).to eq(200)
    end

    it 'should successfully render index template' do
      get "/"
      expect(response).to render_template(:index)
    end

    it 'check the response body includes correct text' do
      get "/"
      expect(response.body).to include('<h1 class="text-center">Budget.IO</h1>')
    end
  end

end
