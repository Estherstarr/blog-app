class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :update_comment_counter
  after_destroy :update_comment_counter

  def update_comment_counter
    Post.find(post_id).update(comments_counter: Post.find(post_id).comments.count)
  end
end
