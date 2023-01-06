class Post < ApplicationRecord

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :body, presence: true,length:{maximum:200}
  validates :post_image, presence: true
  validates :brands, presence: true
  validates :makers, presence: true


  has_one_attached :post_image

  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end

end
