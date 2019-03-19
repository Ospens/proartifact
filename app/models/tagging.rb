# frozen_string_literal: true

class Tagging < ApplicationRecord
  belongs_to :article, optional: true
  belongs_to :news, optional: true
  belongs_to :tag
end
