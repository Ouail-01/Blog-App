class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  # validates :likes_counter, numericality: { allow_blank: true, greater_than_or_equal_to: 0 }

  def update_likes_counter
    post.update(likes_counter: post.likes.count)
  end
end
