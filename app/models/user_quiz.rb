class UserQuiz < ApplicationRecord
  belongs_to :user
  belongs_to :quiz

  enum status: [:answering, :finished]
end
