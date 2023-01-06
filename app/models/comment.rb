class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :post
  
  validates :reply, length: { in: 1..100 }

end
