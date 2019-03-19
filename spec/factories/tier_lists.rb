# frozen_string_literal: true

FactoryBot.define do
  factory :tier_list do
    name { Faker::Games::WorldOfWarcraft.hero }
  end
end
