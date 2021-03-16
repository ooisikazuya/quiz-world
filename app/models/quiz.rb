class Quiz < ApplicationRecord
  has_many :questions
  has_many :user_quizzes
  belongs_to :user

  enum status: [:before_release, :released, :deleted]

  def self.search(search)
    return Quiz.released unless search
    Quiz.released.where(['genre like ?', "%#{search}%"])
  end
end
