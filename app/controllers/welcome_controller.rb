# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    is_admin = current_user&.admin
    fresh_news = News.published(is_admin).limit(3).includes(:taggings, :tags, :votes_down, :votes_up)
    fresh_articles = Article.published(is_admin).limit(3).includes(:taggings, :tags, :votes_down, :votes_up)
    @top_posts = (fresh_news + fresh_articles).sort_by { |k| k['publish_date'] }.reverse.take(3)
    taken_news = fresh_news & @top_posts
    taken_posts = fresh_articles & @top_posts

    taken_posts_ids = taken_posts.pluck(:id)
    taken_news_ids = taken_news.pluck(:id)

    @articles = Article.published(is_admin).limit(4).where.not(id: taken_posts_ids)
                       .includes(:taggings, :tags, :votes_down, :votes_up)
    @news = News.published(is_admin).limit(4).where.not(id: taken_news_ids)
                .includes(:taggings, :tags, :votes_down, :votes_up)
    @pictures = Gallery.last(6)
  end

  def show; end
end
