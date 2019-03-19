# frozen_string_literal: true

class Article < ApplicationRecord
  include Impressionist::IsImpressionable
  is_impressionable
  extend FriendlyId

  has_many :taggings
  has_many :tags, through: :taggings
  has_many :comments, as: :commentable
  has_many :likes, as: :likeable
  has_many :votes_down, -> { where(vote: -1, likeable_type: 'Article') }, class_name: 'Like', foreign_key: :likeable_id
  has_many :votes_up, -> { where(vote: 1, likeable_type: 'Article') }, class_name: 'Like', foreign_key: :likeable_id

  has_attached_file :title_image,
                    styles: { medium: '400x400#', large: '1000x500#', thumb: '750x439#',
                              thumb_small: '380x220#', small: '260x180#' },
                    default_url: '/images/:style/missing.png',
                    path: ':rails_root/public/images/articles/:id/:attachment/:style/:filename',
                    url: '/images/articles/:id/:attachment/:style/:filename',
                    use_timestamp: false

  validates_attachment_content_type :title_image, content_type: %r{\Aimage/.*\z}

  validates :title, :article_text, :publish_date, :short_description, :title_image, presence: true

  scope :published, lambda { |is_admin|
    if is_admin
      where(is_published: true).order('publish_date desc')
    else
      where(is_published: true).where('publish_date <= (?)', Time.current).order('publish_date desc')
    end
  }

  before_validation :translit_name
  friendly_id :eng_title, use: %i[slugged history finders]

  def translit_name
    self.eng_title = Russian.translit(title)
  end

  def all_tags
    if tags.empty?
      ['']
    else
      tags.map(&:name)
    end
  end

  def all_tags=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def slug=(val)
    self[:slug] = if val.nil? || val.empty?
                    nil
                  else
                    val
                  end
  end
end
