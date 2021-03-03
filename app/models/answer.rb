class Answer < ApplicationRecord
  belongs_to :question, dependent: :delete
  validates :judgment, inclusion: { in: [true, false] }
end
