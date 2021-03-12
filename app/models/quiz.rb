class Quiz < ApplicationRecord
  belongs_to :user
  has_many :questions

  enum status: [:before_release, :released, :deleted]
end
