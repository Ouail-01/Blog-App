class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :comments, foreign_key: :author_id
  has_many :posts, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id

  before_validation -> { self.Name = email.split('@')[0] }

  def set_avatar
    max_id = User.maximum('id')
    new_id = max_id ? max_id + 1 : 1
    self.photo ||= "https://i.pravatar.cc/100?u=#{new_id}"
  end

  def latest_three_posts
    posts.includes(:author).order(created_at: :desc).limit(3)
  end
end
