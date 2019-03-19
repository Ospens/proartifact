# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SettingsController, type: :controller do
  let!(:cards) { create_list :card, 4 }
  let!(:news) { create_list :news, 5 }
  let!(:articles) { create_list :article, 4 }
  let!(:decks) { create_list :deck, 4 }

  describe 'GET #sitemap' do
    it 'return sitemap list' do
      get :sitemap
      expect(assigns(:cards).length).to eq(4)
      expect(assigns(:news).length).to eq(5)
      expect(assigns(:articles).length).to eq(4)
      expect(assigns(:decks).length).to eq(4)
      expect(response).to render_template('settings/sitemap')
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #rss' do
    it 'return rss list' do
      get :rss
      expect(assigns(:items).length).to eq(cards.length + news.length)
      expect(response).to render_template('settings/rss')
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #turbo_news' do
    it 'return news list' do
      get :turbo_news
      expect(assigns(:news).length).to eq(5)
      expect(response).to render_template('settings/turbo_news')
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #turbo_articles' do
    it 'return articles list' do
      get :turbo_articles
      expect(assigns(:articles).length).to eq(4)
      expect(response).to render_template('settings/turbo_articles')
      expect(response).to have_http_status(:ok)
    end
  end
end
