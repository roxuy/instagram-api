# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email      { Faker::Internet.unique.email }
    password { 'password' }
    password_confirmation { 'password' }
    fullname { Faker::Name.unique.name }
    username { Faker::Internet.unique.username }
  end
end
