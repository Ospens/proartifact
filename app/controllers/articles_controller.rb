# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: %i[show index]
  before_action :find_article, only: [:show]
  impressionist actions: [:show]

  def index
    @articles = Article.all.published(current_user&.admin)
                       .includes(:taggings, :tags, :votes_down, :votes_up)
                       .paginate(page: params[:page], per_page: 10)
    fresh_when etag: @articles
  end

  def show
    impressionist(@article)
    @shows = @article.impressionist_count
    @comments = if params[:comment]
                  @article.comments.includes(:user).where(id: params[:comment])
                else
                  @article.comments.includes(:user).where(parent_id: nil)
                end
    @comments = @comments.paginate(page: params[:page], per_page: 10)
    fresh_when last_modified: @article.updated_at
  end

  def vote_change
    @article = Article.find_by(id: params[:id])
    article_vote = @article.likes.find_or_initialize_by(user: current_user)
    article_vote.vote = params[:vote]
    article_vote.save!
    render json: true
  end

  private

  def find_article
    @article = Article.friendly.find(params[:id])
  end
end
