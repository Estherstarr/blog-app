require 'rails_helper'

RSpec.describe Like, type: :model do
  post_author = User.create(name: 'John David')
  random_post_by_john = Post.create(author: post_author, title: 'once upon a time')

  it 'create a valid like' do
    expect(Like.create(post: random_post_by_john, author: post_author)).to be_valid
  end

  it 'return Likes count of a post' do
    Like.create(post: random_post_by_john, author: post_author)
    expect(random_post_by_john.likes.count).to eq(2)
  end
end
