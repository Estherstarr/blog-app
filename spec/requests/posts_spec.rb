require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:example) { get '/users/1/posts' }
    it 'the path works' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders the index template' do
      expect(response).to render_template(:index)
    end
    it 'displays the placeholder text' do
      expect(response.body).to include('This page displays all posts for a specific user')
    end
  end

  describe 'GET /show' do
    before(:example) { get '/users/1/posts/1' }
    it 'the path works' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders the index template' do
      expect(response).to render_template(:show)
    end
    it 'displays the placeholder text' do
      expect(response.body).to include('This page shows details of one post for a specific user')
    end
  end
end
