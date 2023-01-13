# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email      { Faker::Internet.unique.email }
    password { 'password' }
    password_confirmation { 'password' }
    confirmed_at { Time.zone.today }
    fullname { Faker::Name.unique.name }
    username { Faker::Internet.unique.username }
  end
end
