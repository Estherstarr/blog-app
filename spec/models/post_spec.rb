require 'rails_helper'

RSpec.describe Post, type: :model do
  post_author = User.create(name: 'John David')
  random_post_by_john = Post.create(author: post_author, title: 'once upon a time')

  it 'create a post with valid title and length' do
    expect(Post.create(author: post_author, title: 'once upon a time')).to be_valid
  end

  it 'create a post that exceeds the title limit' do
    extremely_long_title = 'a' * 300
    expect(Post.create(author: post_author, title: extremely_long_title)).not_to be_valid
  end

  it 'return the number of post counts for a user' do
    expect(post_author.posts_counter).to eq(2)
  end

  it 'return the last five comments of a post' do
    new_user = User.create(name: 'Commenter')
    7.times do |_i|
      Comment.create(post: random_post_by_john, author: new_user, text: 'Hi Tom!')
    end
    comments_hash = random_post_by_john.recent_comments
    expect(comments_hash.length).to eq(5)
  end
end
