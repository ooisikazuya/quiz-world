class Quiz < ApplicationRecord
  has_many :questions
  has_many :user_quizzes
  has_many :likes
  belongs_to :user

  validates :title, presence: true
  validates :genre, presence: true

  enum status: [:before_release, :released, :deleted]

  def self.search(search)
    return Quiz.released unless search
    Quiz.released.where(['genre like ?', "%#{search}%"])
  end
end
