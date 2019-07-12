# frozen_string_literal: true

class AddUserToArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :author_id, :integer, foreign_key: true
  end
end
