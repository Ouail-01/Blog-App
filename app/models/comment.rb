class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  # validates :comment_counter, numericality: { allow_blank: true, greater_than_or_equal_to: 0 }

  def update_comments_counter
    post.update(comment_counter: post.comments.count)
  end
end
