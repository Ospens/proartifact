# frozen_string_literal: true

require 'rails_helper'

RSpec.describe NewsController, type: :controller do
  let!(:news) { create :news }
  let(:user) { create :user }
  let!(:comment) do
    create :comment, commentable_id: news.id,
                     commentable_type: 'News', user_id: user.id
  end

  describe 'GET #index' do
    it 'return all published news' do
      get :index
      expect(response).to render_template(:index)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #show' do
    it 'return news' do
      get :show, params: { id: news.id }
      expect(response).to render_template(:show)
      expect(response).to have_http_status(:ok)
    end

    it 'return news' do
      get :show, params: { id: news.id, comment: comment.id }
      expect(response).to render_template(:show)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #vote_change' do
    it 'up news vote and return true' do
      sign_in user
      post :vote_change, params: { id: news.id, vote: 1 }
      expect(response.body).to eq('true')
      expect(news.likes.first.vote).to eq(1)
      expect(response).to have_http_status(:ok)
    end

    it 'downvote news and return true' do
      sign_in user
      post :vote_change, params: { id: news.id, vote: -1 }
      expect(response.body).to eq('true')
      expect(news.likes.first.vote).to eq(-1)
      expect(response).to have_http_status(:ok)
    end

    it 'undo vote news and return true' do
      sign_in user
      post :vote_change, params: { id: news.id, vote: 0 }
      expect(response.body).to eq('true')
      expect(news.likes.first.vote).to eq(0)
      expect(response).to have_http_status(:ok)
    end

    it 'unauthorize return 204 status' do
      post :vote_change, params: { id: news.id, vote: 0 }
      expect(response.body).to match(/You are being/)
      expect(response).to have_http_status(:found)
    end
  end
end
