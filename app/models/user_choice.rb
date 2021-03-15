class UserChoice < ApplicationRecord
  belongs_to :user_quiz
  belongs_to :question
  belongs_to :answer
end
