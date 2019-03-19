# frozen_string_literal: true

class NewsController < ApplicationController
  before_action :authenticate_user!, except: %i[show index]
  before_action :find_news, only: [:show]
  impressionist actions: [:show]

  def index
    @news = News.all.published(current_user&.admin)
                .includes(:taggings, :tags, :votes_down, :votes_up)
                .paginate(page: params[:page], per_page: 10)
    fresh_when etag: @news
  end

  def show
    impressionist(@news)
    @shows = @news.impressionist_count
    @comments = if params[:comment]
                  @news.comments.where(id: params[:comment]).includes(:user)
                else
                  @news.comments.where(parent_id: nil).includes(:user)
                end
    @comments = @comments.paginate(page: params[:page], per_page: 10)
    fresh_when last_modified: @news.updated_at
  end

  def vote_change
    @news = News.find_by(id: params[:id])
    news_vote = @news.likes.find_or_initialize_by(user: current_user)
    news_vote.vote = params[:vote]
    news_vote.save!
    render json: true
  end

  private

  def find_news
    @news = News.friendly.find(params[:id])
  end
end
