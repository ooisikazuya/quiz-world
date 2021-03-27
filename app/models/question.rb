class Question < ApplicationRecord
  extend OrderAsSpecified
  has_many :answers, dependent: :destroy
  has_many :user_choices
  has_many :user_answers
  belongs_to :quiz
end
