class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, presence: true 
  validates :title, length: { maximum: 250 } 
  validates :comments_counter, numericality: { greater_than_or_equal_to: 0 } 
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0 }
  
  after_save :update_post_counter
  after_destroy :update_post_counter

  def recent_comments
    comments.order(created_at: :DESC).limit(5)
  end

  def update_post_counter
    user.update(posts_counter: user.posts.count)
  end
end
