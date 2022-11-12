require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:example) { get '/users' }
    it 'the path works' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders the index template' do
      expect(response).to render_template(:index)
    end
    it 'displays the placeholder text' do
      expect(response.body).to include('This page shows all users')
    end
  end

  describe 'GET /show' do
    before(:example) { get '/users/1' }
    it 'the path works' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders the index template' do
      expect(response).to render_template(:show)
    end
    it 'displays the placeholder text' do
      expect(response.body).to include('This page shows a specific user')
    end
  end
end
