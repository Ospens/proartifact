# frozen_string_literal: true

FactoryBot.define do
  factory :gallery do
    title { Faker::Games::Dota.team }
    description_img { Faker::Games::Dota.item }
    publish_date { Time.now - 1.days }
    image { Rack::Test::UploadedFile.new(Rails.root.join('public', 'tl_pic.jpg'), 'image/jpg') }
  end
end
