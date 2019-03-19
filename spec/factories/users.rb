# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    nickname { 'Test' }
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
    confirmed_at { Date.today }
  end
end
