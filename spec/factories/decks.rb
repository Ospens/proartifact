# frozen_string_literal: true

FactoryBot.define do
  factory :deck do
    name { Faker::Games::WorldOfWarcraft.hero }
    published_at { Time.current }
    user
  end
end
