class Quiz < ApplicationRecord
  has_many :questions
  has_many :user_quizzes
  has_many :user, through: :user_quizzes

  enum status: [:before_release, :released, :deleted]

  def self.search(search)
    return Quiz.released unless search
    Quiz.released.where(['genre like ?', "%#{search}%"])
  end
end
