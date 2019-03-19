# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      respond_to do |format|
        format.html { redirect_to @commentable }
        format.js
      end
    else
      redirect_to @commentable, alert: 'Ошибка :('
    end
  end

  def destroy
    @comment = @commentable.comments.find(params[:id])
    return false unless current_user.id == @comment.user_id

    @comment.destroy
    redirect_to @commentable
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :parent_id)
  end
end
