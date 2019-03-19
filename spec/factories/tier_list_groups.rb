# frozen_string_literal: true

FactoryBot.define do
  factory :tier_list_group do
    name { Faker::Games::WorldOfWarcraft.hero }
    order { 1 }
    tier_list
  end
end
