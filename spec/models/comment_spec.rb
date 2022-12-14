require 'rails_helper'

RSpec.describe Comment, type: :model do
  post_author = User.create(name: 'John David')
  random_post_by_john = Post.create(author: post_author, title: 'once upon a time')

  it 'create a valid comment' do
    expect(Comment.create(post: random_post_by_john, author: post_author, text: 'thanks for reading')).to be_valid
  end

  it 'return comments count of a post' do
    Comment.create(post: random_post_by_john, author: post_author, text: 'thanks for reading')
    expect(random_post_by_john.comments.count).to eq(2)
  end
end
