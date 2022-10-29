class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_likes_counter
    Post.find(post_id).update(likes_counter: Post.find(post_id).likes.count)
  end
end
