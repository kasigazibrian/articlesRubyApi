# frozen_string_literal: true

FactoryBot.define do
  factory :article, class: 'Article' do
    title { Faker::Lorem.word }
    body { Faker:: Lorem.sentence }
    association :author_id, factory: :user
  end
end
