# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DecksController, type: :controller do
  let!(:deck) { create :deck }
  let(:user) { create :user }
  let!(:comment) do
    create :comment, commentable_id: deck.id,
                     commentable_type: 'Deck', user_id: user.id
  end

  describe 'GET #index' do
    it 'return all published decks' do
      get :index
      expect(response).to render_template(:index)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #show' do
    it 'return deck' do
      get :show, params: { id: deck.friendly_id }
      expect(response).to render_template(:show)
      expect(response).to have_http_status(:ok)
    end

    it 'return deck' do
      get :show, params: { id: deck.id, comment: comment.id }
      expect(response).to render_template(:show)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #vote_change' do
    it 'up deck vote and return true' do
      sign_in user
      post :vote_change, params: { id: deck.id, vote: 1 }
      expect(response.body).to eq('true')
      expect(deck.likes.first.vote).to eq(1)
      expect(response).to have_http_status(:ok)
    end

    it 'downvote deck and return true' do
      sign_in user
      post :vote_change, params: { id: deck.id, vote: -1 }
      expect(response.body).to eq('true')
      expect(deck.likes.first.vote).to eq(-1)
      expect(response).to have_http_status(:ok)
    end

    it 'undo vote deck and return true' do
      sign_in user
      post :vote_change, params: { id: deck.id, vote: 0 }
      expect(response.body).to eq('true')
      expect(deck.likes.first.vote).to eq(0)
      expect(response).to have_http_status(:ok)
    end

    it 'unauthorize return 204 status' do
      post :vote_change, params: { id: deck.id, vote: 0 }
      expect(response.body).to match(/You are being/)
      expect(response).to have_http_status(:found)
    end
  end
end
