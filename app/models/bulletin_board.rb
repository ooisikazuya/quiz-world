class BulletinBoard < ApplicationRecord
  belongs_to :user
  
  validates :message, presence: true

  def self.search(search)
    return BulletinBoard.all unless search
    BulletinBoard.where(['message like ?', "%#{search}%"])
  end
end
