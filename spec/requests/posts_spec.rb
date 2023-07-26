require 'rails_helper'

describe 'GET all posts for a user' do
  let(:user) { User.create!(Name: 'Test User', PostsCounter: 0) }

  it 'returns a successful response' do
    get "/users/#{user.id}/posts"

    expect(response).to be_successful
    expect(response.body).to include('<h2>Test User</h2>')
    expect(response).to render_template(:index)
  end
end

describe 'GET specific post for a user' do
  let(:user) { User.create!(Name: 'Test User', PostsCounter: 0) }

  it 'renders a specific post from a user' do
    post = Post.create!(Title: 'Test Post', author_id: user.id, CommentsCounter: 0, LikesCounter: 0)
    get "/users/#{user.id}/posts/#{post.id}"

    expect(response).to be_successful
    expect(response.body).to include('<h2>Test Post | by Test User</h2>')
    expect(response).to render_template(:show)
  end
end