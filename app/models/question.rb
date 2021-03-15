class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :user_choices
  belongs_to :quiz
end
