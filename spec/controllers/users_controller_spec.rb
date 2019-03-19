# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create :user }

  describe 'GET #index' do
    it 'redirect to root path' do
      get :index
      expect(response).to redirect_to('http://test.host/')
      expect(response).to have_http_status(:found)
    end
  end

  describe 'GET #show' do
    it 'return user' do
      get :show, params: { id: user.id }
      expect(assigns(:user)).to eq(user)
      expect(response).to render_template(:show)
      expect(response).to have_http_status(:ok)
    end
  end
end
