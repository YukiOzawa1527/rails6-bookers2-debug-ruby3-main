class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one_attached :profile_image

  validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates :introduction, length: { maximum: 50 }

  has_many :relationsip, foreign_key: :follower_id, dependent: :destroy
  has_many :followers, through: :relationsips, source: :followed
  has_many :reverse_of_relationsips, class_name: 'Relationsip', foreign_key: :followed_id, dependent: :destroy
  has_many :followeds, through: :revers_of_relationsips, source: :follower

  def is_followed_by?(user)
    reverse_of_relationsips.find_by(follower_id: user.id).present?
  end
  
  
  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end
end
