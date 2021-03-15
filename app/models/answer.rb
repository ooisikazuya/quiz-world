class Answer < ApplicationRecord
  has_many :user_choices
  belongs_to :question, dependent: :delete
  validates :judgment, inclusion: { in: [true, false] }
end
