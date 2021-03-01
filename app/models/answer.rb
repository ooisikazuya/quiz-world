class Answer < ApplicationRecord
  belongs_to :question
  validates :judgment, inclusion: { in: [true, false] }
end
