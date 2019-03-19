# frozen_string_literal: true

FactoryBot.define do
  factory :tag do
    name { Faker::Games::WorldOfWarcraft.hero }
  end
end
