# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GalleriesController, type: :controller do
  let!(:gallery) { create :gallery }
  let(:user) { create :user }

  describe 'GET #index' do
    it 'return all published gallerys' do
      get :index
      expect(response).to render_template(:index)
      expect(response).to have_http_status(:ok)
    end
  end
end
