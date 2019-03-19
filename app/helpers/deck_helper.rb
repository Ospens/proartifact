# frozen_string_literal: true

module DeckHelper
  def mana_array(cards)
    array = [0, 0, 0, 0, 0, 0, 0, 0]
    cards.each do |card|
      if card.manacost > 8
        array[7] = array[7] + card.deck_cards.find_by(deck_id: @deck.id).card_count
      else
        array[card.manacost - 1] = array[card.manacost - 1] + card.deck_cards.find_by(deck_id: @deck.id).card_count
      end
    end
    array
  end

  def cards_count(card_class, is_item = false)
    if is_item
      @cards.where(item_type: card_class)
    else
      @cards.where(card_class: card_class)
    end.map { |card| card.deck_cards.find_by(deck_id: @deck.id).card_count }.inject(0, :+)
  end
end
