# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :articles, foreign_key: 'author_id'
  validates :name, presence: true, format: { with: /[A-Za-z]/ }

  scope :admin?, -> { self.admin }

  def authentication_update
    self.last_sign_in_at = Time.now
    self.sign_in_count += 1
    save
  end
end
