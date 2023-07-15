require 'rails_helper'

RSpec.describe Like, type: :model do
  like = Like.new(author_id: 1, post_id: 1)

  it 'has an author id' do
    expect(like.author_id).to_not eql 5
    expect(like.author_id).to eql 1
  end

  it 'has an post id' do
    expect(like.post_id).to_not eql(-5)
    expect(like.post_id).to eql 1
  end

  it 'checks likes_counter method' do
    user = User.new(Name: 'Ouail', Photo: 'www.unsplash.com', Bio: 'Lorem ipsum', PostsCounter: 5)

    post = Post.new(author: user, Title: 'first post', Text: 'this is the first post', CommentsCounter: 3,
    LikesCounter: 2)

    like = Like.new(author_id: 1, post:)

    post.LikesCounter = 2
    post.save

    like.update_likes_counter
    like.update_likes_counter

    expect(post.LikesCounter).to_not eq(2)
  end
end