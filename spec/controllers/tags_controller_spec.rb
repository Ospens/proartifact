# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TagsController, type: :controller do
  let!(:tag) { create :tag }
  let!(:article) { create :article, tags: [tag] }

  describe 'GET #show' do
    it 'return tagged articles' do
      get :show, params: { id: tag.name }
      expect(assigns(:articles).length).to eq(1)
      expect(response).to render_template(:show)
      expect(response).to have_http_status(:ok)
    end
  end
end
