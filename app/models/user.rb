class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image

  validates :introduction, length: { maximum: 50 }
  validates :name, length: { in: 2..20 }
  has_many :books, dependent: :destroy


end

# 1