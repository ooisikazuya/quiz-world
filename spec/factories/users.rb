FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@example.com" }
    nickname { 'nickname' }
    password { 'password' }
  end
end