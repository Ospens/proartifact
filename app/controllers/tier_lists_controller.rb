# frozen_string_literal: true

class TierListsController < ApplicationController
  impressionist actions: [:show]

  def show
    @tier_list = TierList.friendly.find(params[:id])
    @tl_groups = @tier_list.tier_list_groups.order(:order)
  end
end
