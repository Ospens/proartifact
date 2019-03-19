# frozen_string_literal: true

class GalleriesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  impressionist actions: [:index]

  def index
    @pictures = Gallery.all.paginate(page: params[:page], per_page: 36)
    fresh_when etag: @pictures
  end
end
