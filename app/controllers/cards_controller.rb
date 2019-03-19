# frozen_string_literal: true

class CardsController < ApplicationController
  layout false, only: %i[filter_cards tooltip_card]

  def index
    @cards = Card.includes(:hero_parent)
                 .order(:title)
                 .paginate(page: params[:page], per_page: 50)

    respond_to do |format|
      format.html
      format.js
    end
    fresh_when etag: @cards
  end

  def filter_cards
    @cards = if params.present?
               Card.includes(:hero_parent).search_query(params[:search]).where(filter_params)
                   .paginate(page: params[:page], per_page: 50).order(:title)
             else
               Card.includes(:hero_parent).paginate(page: params[:page], per_page: 50).order(:title)
             end
    respond_to do |format|
      format.html { render 'cards/_list', locals: { cards: @cards } }
      format.js
    end
    fresh_when etag: @cards
  end

  def show
    @card = Card.includes(:hero_parent).friendly.find(params[:id])
    @comments = if params[:comment]
                  @card.comments.where(id: params[:comment])
                else
                  @card.comments.where(parent_id: nil)
                end
    @comments = @comments.page(params[:page])
    fresh_when last_modified: @card.updated_at
  end

  def card_list
    @cards = Card.all.order(:color, :title)
    @items = @cards.select { |card| card.card_class == 3 }.group_by(&:item_type)
    @heroes = @cards.select { |card| card.card_class == 1 }.group_by(&:color)
    @spells = @cards.select { |card| card.card_class == 2 }.group_by(&:color)
    @creeps = @cards.select { |card| card.card_class == 4 }.group_by(&:color)
    @improvements = @cards.select { |card| card.card_class == 5 }.group_by(&:color)

    @heroes[5] = @items[1]
    @spells[5] = @items[2]
    @creeps[5] = @items[3]
    @improvements[5] = @items[4]

    fresh_when etag: @cards
  end

  def tooltip_card
    @card = Card.includes(:hero_parent).find(params[:id])
    respond_to do |format|
      format.html { render 'cards/_tooltip_card', locals: { cards: @cards } }
      format.js
    end
    fresh_when last_modified: @card.updated_at
  end

  private

  def filter_params
    params.permit(card_class: [],
                  rarity: [],
                  color: [],
                  item_type: [],
                  card_set: [])
  end
end
