# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'associations' do
    it { should belong_to :user }
  end

  describe 'validations' do
    it { should validate_length_of(:body).is_at_least(10) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
  end
end
