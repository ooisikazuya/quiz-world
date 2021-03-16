class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bulletin_boards
  has_many :user_quizzes
  has_many :quizzes, through: :user_quizzes

  validates :nickname, presence: true

  mount_uploader :icon, IconUploader
end
