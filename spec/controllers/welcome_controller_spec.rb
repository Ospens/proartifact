# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  let!(:news) { create_list :news, 3 }
  let!(:articles) { create_list :article, 4 }
  let!(:gallery) { create :gallery }

  describe 'GET #index' do
    it 'return articles, news and galleries' do
      get :index
      expect(assigns(:news).length).to eq(3)
      expect(assigns(:articles).length).to eq(1)
      expect(assigns(:pictures).length).to eq(1)
      expect(response).to render_template(:index)
      expect(response).to have_http_status(:ok)
    end
  end
end
