# frozen_string_literal: true

class Card < ApplicationRecord
  # 1 - green
  # 2 - red
  # 3 - black
  # 4 - blue
  extend FriendlyId
  friendly_id :eng_title, use: :slugged

  has_many :deck_cards
  has_many :decks, through: :deck_cards
  belongs_to :hero_parent, class_name: 'Card', optional: true
  has_many :children_cards, class_name: 'Card', foreign_key: 'hero_parent_id'
  has_many :comments, as: :commentable

  has_attached_file :image_card, styles: { medium: '300x300',
                                           large: '600x600' },
                                 default_url: '/images/:style/missing.png',
                                 path: ':rails_root/public/images/cards/:id/main_img/:attachment/:style/:filename',
                                 url: '/images/cards/:id/main_img/:attachment/:style/:filename',
                                 use_timestamp: false
  validates_attachment_content_type :image_card, content_type: %r{\Aimage/.*\z}
  attr_accessor :delete_image_card
  before_validation { image_card.clear if delete_image_card == '1' }

  has_attached_file :hero_icon, styles: { small: '40x40' },
                                default_url: '/images/:style/missing.png',
                                path: ':rails_root/public/images/cards/:id/hero_icon/:attachment/:style/:filename',
                                url: '/images/cards/:id/hero_icon/:attachment/:style/:filename',
                                use_timestamp: false
  validates_attachment_content_type :hero_icon, content_type: %r{\Aimage/.*\z}
  attr_accessor :delete_hero_icon
  before_validation { hero_icon.clear if delete_hero_icon == '1' }

  has_attached_file :hero_spells, styles: { small: '100x100' },
                                  default_url: '/images/:style/missing.png',
                                  path: ':rails_root/public/images/cards/:id/hero_spells/:attachment/:style/:filename',
                                  url: '/images/cards/:id/hero_spells/:attachment/:style/:filename',
                                  use_timestamp: false
  validates_attachment_content_type :hero_spells, content_type: %r{\Aimage/.*\z}

  attr_accessor :delete_hero_spells
  before_validation { hero_spells.clear if delete_hero_spells == '1' }
  has_attached_file :second_hero_spells, styles: { small: '100x100' },
                                         default_url: '/images/:style/missing.png',
                                         path: ':rails_root/public/images/cards/:id/second_hero_spells' \
                                               '/:attachment/:style/:filename',
                                         url: '/images/cards/:id/second_hero_spells/:attachment/:style/:filename',
                                         use_timestamp: false
  validates_attachment_content_type :second_hero_spells, content_type: %r{\Aimage/.*\z}

  attr_accessor :delete_second_hero_spells
  before_validation { second_hero_spells.clear if delete_second_hero_spells == '1' }
  has_attached_file :impr_ability, styles: { small: '60x60' },
                                   default_url: '/images/:style/missing.png',
                                   path: ':rails_root/public/images/cards/:id/impr_ability' \
                                         '/:attachment/:style/:filename',
                                   url: '/images/cards/:id/impr_ability/:attachment/:style/:filename',
                                   use_timestamp: false
  validates_attachment_content_type :impr_ability, content_type: %r{\Aimage/.*\z}
  attr_accessor :delete_impr_ability
  before_validation { impr_ability.clear if delete_impr_ability == '1' }

  validates :title, :card_class, :rarity, :card_set, presence: true

  scope :sorted_by, ->(_sort_option) { where.not(id: 20) }
  scope :search_query, lambda { |query|
    return nil if query.blank?

    terms = query.downcase.split(/\s+/)
    terms = terms.map do |e|
      (e.tr('*', '%') + '%').gsub(/%+/, '%')
    end
    num_or_conds = 2
    where(
      terms.map do |_term|
        '(LOWER(cards.title) LIKE ? OR LOWER(cards.description) LIKE ?)'
      end.join(' AND '),
      *terms.map { |e| [e] * num_or_conds }.flatten
    )
  }
  def slug=(val)
    self[:slug] = if val.nil? || val.empty?
                    nil
                  else
                    val
                  end
  end
end
