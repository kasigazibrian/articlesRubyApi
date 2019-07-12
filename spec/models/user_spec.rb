# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { create :user }
  describe 'associations' do
    it { should have_many(:articles).with_foreign_key('author_id') }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should allow_value('Brian').for(:name) }
    it { should_not allow_value('4564').for(:name) }
  end
end
