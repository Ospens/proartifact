# frozen_string_literal: true

class DecksController < ApplicationController
  before_action :authenticate_user!, except: %i[show index]

  def index
    @decks = Deck.all.published(current_user&.admin)
                 .includes(:votes_down, :votes_up)
                 .paginate(page: params[:page], per_page: 20)
    fresh_when etag: @decks
  end

  def show
    @deck = Deck.friendly.find(params[:id])
    impressionist(@deck)
    @shows = @deck.impressionist_count
    @heroes = @deck.cards.where(card_class: 1).order('deck_cards.hero_order')
    @cards = @deck.cards.where.not(card_class: 1).order(:manacost)
    @comments = if params[:comment]
                  @deck.comments.includes(:user).where(id: params[:comment])
                else
                  @deck.comments.includes(:user).where(parent_id: nil)
                end
    @comments = @comments.paginate(page: params[:page], per_page: 10)
  end

  def vote_change
    @deck = Deck.find_by(id: params[:id])
    deck_vote = @deck.likes.find_or_initialize_by(user: current_user)
    deck_vote.vote = params[:vote]
    deck_vote.save!
    render json: true
  end
end
