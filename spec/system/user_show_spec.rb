require 'rails_helper'

RSpec.describe 'user profile page', type: :system do
  before do
    @user1 = User.create(Name: 'Test User1',
                         Photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                         Bio: 'Test bio 1.',
                         PostsCounter: 0)
    @user2 = User.create(Name: 'Test User2',
                         Photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                         Bio: 'Test bio 2.',
                         PostsCounter: 0)

    @post1 = Post.create(author: @user1, Title: 'Post 1',
                         Text: 'This is the content of the first post.',
                         CommentsCounter: 0,
                         LikesCounter: 0)
    @post2 = Post.create(author: @user2, Title: 'Post 2',
                         Text: 'This is the first post by Test User2.',
                         CommentsCounter: 0, LikesCounter: 0)
    @post3 = Post.create(author: @user1, Title: 'Post 3',
                         Text: 'The second post is here with some interesting content.',
                         CommentsCounter: 0, LikesCounter: 0)
    @post4 = Post.create(author: @user2, Title: 'Post 4',
                         Text: 'Another post by Test User2.',
                         CommentsCounter: 0, LikesCounter: 0)
    @post5 = Post.create(author: @user1, Title: 'Post 5',
                         Text: 'Check out the third post with lots of exciting stuff.',
                         CommentsCounter: 0, LikesCounter: 0)
    @post6 = Post.create(author: @user2, Title: 'Post 6',
                         Text: 'Yet another post by Test User2.',
                         CommentsCounter: 0, LikesCounter: 0)

    Comment.create(post: @post1, author: @user2, Text: 'I enjoyed reading this.')
    Comment.create(post: @post2, author: @user1,
                   Text: 'Looking forward to more posts!')
  end

  it "show the user's profile picture" do
    visit "/users/#{@user1.id}"
    expect(page).to have_selector("img[src*='#{@user1.Photo}']")
  end

  it "show the user's picture picture" do
    visit "/users/#{@user1.id}"
    expect(page).to have_content(@user1.Name)
  end

  it 'shows number of posts the user has written' do
    visit "/users/#{@user1.id}"
    expect(page).to have_content("Number of posts: #{@user1.PostsCounter}")
  end

  it 'shows theuser\'s bio ' do
    visit "/users/#{@user1.id}"
    expect(page).to have_content(@user1.Bio)
  end

  it 'shows three recent posts' do
    visit "/users/#{@user1.id}"
    expect(page).to have_content(@post1.Text)
    expect(page).to have_content(@post3.Text)
    expect(page).to have_content(@post5.Text)
    expect(page).not_to have_content(@post4.Text)
  end

  it 'should redirect to the users profile page' do
    visit "/users/#{@user1.id}"
    click_button('See all')
    expect(page).to have_current_path("/users/#{@user1.id}/posts")
  end

  it 'show button that lets me view all of a users posts ' do
    visit "/users/#{@user2.id}"
    expect(page).to have_content('See all posts')
  end

  it 'should redirect to the user\'s post\'s page' do
    visit "/users/#{@user1.id}"
    click_link 'See all posts'
    expect(page).to have_current_path("/users/#{@user1.id}/posts")
  end

end
