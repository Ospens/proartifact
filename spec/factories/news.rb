# frozen_string_literal: true

FactoryBot.define do
  factory :news do
    title { Faker::Games::Dota.team }
    news_text { Faker::Games::Dota.item }
    short_description { Faker::Games::Dota.quote }
    publish_date { Time.now - 1.days }
    title_image { Rack::Test::UploadedFile.new(Rails.root.join('public', 'tl_pic.jpg'), 'image/jpg') }
  end
end
