# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :commentable, polymorphic: true, touch: true
  belongs_to :parent, optional: true, class_name: 'Comment'

  validates_length_of :body, minimum: 3

  scope :not_deleted, -> { where(deleted_at: nil) }
  def comments
    Comment.where(commentable: commentable, parent_id: id)
  end

  def destroy
    update(deleted_at: Time.current)
  end

  def deleted?
    deleted_at.present?
  end
end
