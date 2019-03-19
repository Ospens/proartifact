# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  let!(:article) { create :article }
  let(:user) { create :user }
  let!(:comment) do
    create :comment, commentable_id: article.id,
                     commentable_type: 'Article', user_id: user.id
  end

  describe 'GET #index' do
    it 'return all published articles' do
      get :index
      expect(response).to render_template(:index)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #show' do
    it 'return article' do
      get :show, params: { id: article.friendly_id }
      expect(response).to render_template(:show)
      expect(response).to have_http_status(:ok)
    end

    it 'return article' do
      get :show, params: { id: article.id, comment: comment.id }
      expect(response).to render_template(:show)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #vote_change' do
    it 'up article vote and return true' do
      sign_in user
      post :vote_change, params: { id: article.id, vote: 1 }
      expect(response.body).to eq('true')
      expect(article.likes.first.vote).to eq(1)
      expect(response).to have_http_status(:ok)
    end

    it 'downvote article and return true' do
      sign_in user
      post :vote_change, params: { id: article.id, vote: -1 }
      expect(response.body).to eq('true')
      expect(article.likes.first.vote).to eq(-1)
      expect(response).to have_http_status(:ok)
    end

    it 'undo vote article and return true' do
      sign_in user
      post :vote_change, params: { id: article.id, vote: 0 }
      expect(response.body).to eq('true')
      expect(article.likes.first.vote).to eq(0)
      expect(response).to have_http_status(:ok)
    end

    it 'unauthorize return 204 status' do
      post :vote_change, params: { id: article.id, vote: 0 }
      expect(response.body).to match(/You are being/)
      expect(response).to have_http_status(:found)
    end
  end
end
