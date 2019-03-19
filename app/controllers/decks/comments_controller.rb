# frozen_string_literal: true

class Decks::CommentsController < CommentsController
  before_action :set_commentable

  private

  def set_commentable
    @commentable = Deck.find(params[:deck_id])
  end
end
