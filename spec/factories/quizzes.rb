FactoryBot.define do
  factory :quiz do
    user { create(:user) }
    title { 'title' }
    genre { 'genre' }
    status { 'released' }
  end
end