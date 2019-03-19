# frozen_string_literal: true

class Deck < ApplicationRecord
  include Impressionist::IsImpressionable
  is_impressionable
  extend FriendlyId

  belongs_to :user
  has_many :deck_cards
  has_many :cards, through: :deck_cards
  has_many :comments, as: :commentable
  has_many :likes, as: :likeable
  has_many :votes_down, -> { where(vote: -1, likeable_type: 'Deck') }, class_name: 'Like', foreign_key: :likeable_id
  has_many :votes_up, -> { where(vote: 1, likeable_type: 'Deck') }, class_name: 'Like', foreign_key: :likeable_id

  before_validation :translit_name
  validates :name, presence: true
  friendly_id :eng_name, use: :slugged

  scope :published, lambda { |is_admin|
    if is_admin
      where(is_published: true).order('published_at desc')
    else
      where(is_published: true).where('published_at <= (?)', Time.current).order('published_at desc')
    end
  }

  def translit_name
    self.eng_name = Russian.translit(name)
  end

  def slug=(val)
    self[:slug] = if val.nil? || val.empty?
                    nil
                  else
                    val
                  end
  end
end
