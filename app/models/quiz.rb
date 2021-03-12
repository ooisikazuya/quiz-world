class Quiz < ApplicationRecord
  belongs_to :user
  has_many :questions

  enum status: [:before_release, :released, :deleted]

  def self.search(search)
    return Quiz.released unless search
    Quiz.released.where(['genre like ?', "%#{search}%"])
  end
end
