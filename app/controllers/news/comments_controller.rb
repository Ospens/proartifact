# frozen_string_literal: true

class News::CommentsController < CommentsController
  before_action :set_commentable

  private

  def set_commentable
    @commentable = News.find(params[:news_id])
  end
end
