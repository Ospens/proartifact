# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CardsController, type: :controller do
  let!(:card) { create :card, title: 'test_card' }
  let(:user) { create :user }
  let!(:comment) do
    create :comment, commentable_id: card.id,
                     commentable_type: 'Card', user_id: user.id
  end

  describe 'GET #index' do
    let!(:cards) { create_list :card, 4 }
    it 'return all published cards' do
      get :index
      expect(assigns(:cards).length).to eq(5)
      expect(response).to render_template(:index)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #show' do
    it 'return card' do
      get :show, params: { id: card.id }
      expect(response).to render_template(:show)
      expect(response).to have_http_status(:ok)
    end

    it 'return card' do
      get :show, params: { id: card.id, comment: comment.id }
      expect(response).to render_template(:show)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #filter_cards' do
    let!(:cards) { create_list :card, 3, rarity: 2 }
    it 'return cards if have search and card_class' do
      get :filter_cards, params: { search: card.title.split(' ')[0], card_class: [card.card_class] }
      expect(assigns(:cards).length).to eq(1)
      expect(response).to render_template('cards/_list')
      expect(response).to have_http_status(:ok)
    end

    it 'return cards if have only search' do
      get :filter_cards, params: { search: card.title.split(' ')[0] }
      expect(assigns(:cards).length).to eq(1)
      expect(response).to render_template('cards/_list')
      expect(response).to have_http_status(:ok)
    end

    it 'return cards if have only card' do
      get :filter_cards, params: { rarity: [cards.first.rarity] }
      expect(assigns(:cards).length).to eq(3)
      expect(response).to render_template('cards/_list')
      expect(response).to have_http_status(:ok)
    end

    it 'return cards withot filters' do
      get :filter_cards
      expect(assigns(:cards).length).to eq(4)
      expect(response).to render_template('cards/_list')
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #card_list' do
    let!(:card_item) { create :card, card_class: 3, item_type: 3 }
    let!(:card_hero) { create :card, card_class: 1, color: 4 }
    let!(:card_spell) { create :card, card_class: 2, color: 4 }
    let!(:card_creep) { create :card, card_class: 4, color: 2 }
    let!(:card_improvement) { create :card, card_class: 5, color: 3 }
    it 'return cards by groups' do
      get :card_list
      expect(assigns(:cards).length).to eq(6)
      expect(response).to render_template('cards/card_list')
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #tooltip_card' do
    it 'return cards by groups' do
      get :tooltip_card, params: { id: card.id }
      expect(assigns(:card)).to eq(card)
      expect(response).to render_template('cards/_tooltip_card')
      expect(response).to have_http_status(:ok)
    end
  end
end
