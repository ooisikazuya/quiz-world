class Answer < ApplicationRecord
  has_many :user_choices
  has_many :user_answers
  belongs_to :question, dependent: :delete
  validates :judgment, inclusion: { in: [true, false] }
end
