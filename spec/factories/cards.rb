# frozen_string_literal: true

FactoryBot.define do
  factory :card do
    title { Faker::Games::WorldOfWarcraft.hero }
    description { Faker::Games::WorldOfWarcraft.quote }
    card_class { 1 }
    rarity { 1 }
    card_set { 1 }
  end
end
