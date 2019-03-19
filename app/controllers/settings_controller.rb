# frozen_string_literal: true

class SettingsController < ApplicationController
  layout false, only: %i[sitemap robots rss]
  before_action :init_sitemap, only: :sitemap

  def sitemap
    @articles = Article.where('publish_date <= (?)', Time.current)
    @news = News.where('publish_date <= (?)', Time.current)
    @decks = Deck.where('published_at <= (?)', Time.current)
    @cards = Card.all
  end

  def rss
    articles = Article.where('publish_date <= (?)', Time.current).order('publish_date desc')
    news = News.where('publish_date <= (?)', Time.current).order('publish_date desc')
    @items = (articles + news).sort_by(&:publish_date).reverse
  end

  def turbo_news
    @news = News.where('publish_date <= (?)', Time.current).order('publish_date desc')
  end

  def turbo_articles
    @articles = Article.where('publish_date <= (?)', Time.current).order('publish_date desc')
  end

  def robots; end

  def privacy; end

  def rules; end

  private

  def init_sitemap
    headers['Content-Type'] = 'application/xml'
  end

  def zen_verify; end
end
