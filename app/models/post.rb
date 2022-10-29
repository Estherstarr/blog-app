class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  after_save :update_post_counter
  after_destroy :update_post_counter

  def recent_comments
    comments.order(created_at: :DESC).limit(5)
  end

  def update_post_counter
    user.update(posts_counter: user.posts.count)
  end
end
