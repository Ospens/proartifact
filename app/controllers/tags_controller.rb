# frozen_string_literal: true

class TagsController < ApplicationController
  def show
    @tag = Tag.find_by(name: params[:id])
    @articles = @tag&.articles
  end
end
