# frozen_string_literal: true

class Article < ApplicationRecord
  belongs_to :user, foreign_key: :author_id
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
