# frozen_string_literal: true

module CardsHelper
  ICON_TYPES = {
    1 => 'hero',
    2 => 'spell',
    4 => 'creep',
    5 => 'improvement',
    'i-1' => 'accessories',
    'i-2' => 'armor',
    'i-3' => 'attack',
    'i-4' => 'consumables'
  }.freeze

  CARD_COLOR = {
    1 => 'green',
    2 => 'red',
    3 => '#7d7d7d',
    4 => '#404aee'
  }.freeze

  COLOR_CLASS = {
    1 => 'green',
    2 => 'red',
    3 => 'black',
    4 => 'blue'
  }.freeze

  COLOR_TO_WORD = {
    1 => 'Зеленый',
    2 => 'Красный',
    3 => 'Черный',
    4 => 'Синий'
  }.freeze

  TYPE_TITLE = {
    1 => 'Герой',
    2 => 'Заклинание',
    3 => 'Предмет',
    4 => 'Крип',
    5 => 'Улучшение'
  }.freeze

  RARITY_COLOR = {
    1 => '#ffffff',
    2 => '#cd7f32',
    3 => '#95a5a6',
    4 => '#ffba01'
  }.freeze

  RARITY_TO_WORD = {
    1 => 'Базовая',
    2 => 'Обычная',
    3 => 'Необычная',
    4 => 'Редкая'
  }.freeze

  ABILITY_TO_WORD = {
    1 => 'Continuous effect',
    2 => 'Reactive Ability',
    3 => 'Passive Ability',
    4 => 'Active Ability'
  }.freeze

  def type_class(type_id, ended = '')
    case type_id
    when 1
      "type-heroes#{ended}"
    when 2
      "type-spell#{ended}"
    when 3
      "type-item#{ended}"
    when 4
      "type-creep#{ended}"
    when 5
      "type-impoovment#{ended}"
    else
      "type-spell#{ended}"
    end
  end

  def color_class(color_id)
    color_id.nil? ? 'item_gold' : COLOR_CLASS[color_id]
  end

  def type_title(type_id)
    type_id.nil? ? 'N/A' : TYPE_TITLE[type_id]
  end

  def color_card(color_id)
    color_id.nil? ? 'item_gold' : CARD_COLOR[color_id]
  end

  def color_to_word(color_id)
    color_id.nil? ? 'N/A' : COLOR_TO_WORD[color_id]
  end

  def rarity_color(rarity_id)
    rarity_id.nil? ? '#cecece' : RARITY_COLOR[rarity_id]
  end

  def rarity_to_word(rarity_id)
    rarity_id.nil? ? 'N/A' : RARITY_TO_WORD[rarity_id]
  end

  def ability_to_word(ability_id)
    ability_id.nil? ? 'N/A' : ABILITY_TO_WORD[ability_id]
  end

  def type_to_icon(type_id)
    ICON_TYPES[type_id]
  end
end
