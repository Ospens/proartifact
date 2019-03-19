# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    redirect_to root_path
  end

  def show
    @user = User.find(params[:id])
    @comments = @user.comments.not_deleted.order('created_at desc')
  end
end
