class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_save :update_post_counter
  after_destroy :update_post_counter

  def update_comment_counter
    Post.find(post_id).update(comments_counter: Post.find(post_id).comments.count)
  end
end
