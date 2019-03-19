# frozen_string_literal: true

class SteamParserController < ApplicationController
  before_action :authenticate_user!
  respond_to :html, :js

  def market_prices
    return unless current_user&.admin

    SteamParserJob.perform_now
    render json: true
  end
end
