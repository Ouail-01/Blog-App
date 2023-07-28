require 'rails_helper'

RSpec.describe 'user profile page', type: :system do
  before do
    @user1 = User.create(name: 'Test User1',
                         photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                         bio: 'Test bio 1.',
                         posts_counter: 0)
    @user2 = User.create(name: 'Test User2',
                         photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                         bio: 'Test bio 2.',
                         posts_counter: 0)

    @post1 = Post.create(author: @user1, title: 'Post 1',
                         text: 'This is the content of the first post.',
                         comment_counter: 0,
                         likes_counter: 0)
    @post2 = Post.create(author: @user2, title: 'Post 2',
                         text: 'This is the first post by Test User2.',
                         comment_counter: 0, likes_counter: 0)
    @post3 = Post.create(author: @user1, title: 'Post 3',
                         text: 'The second post is here with some interesting content.',
                         comment_counter: 0, likes_counter: 0)
    @post4 = Post.create(author: @user2, title: 'Post 4',
                         text: 'Another post by Test User2.',
                         comment_counter: 0, likes_counter: 0)
    @post5 = Post.create(author: @user1, title: 'Post 5',
                         text: 'Check out the third post with lots of exciting stuff.',
                         comment_counter: 0, likes_counter: 0)
    @post6 = Post.create(author: @user2, title: 'Post 6',
                         text: 'Yet another post by Test User2.',
                         comment_counter: 0, likes_counter: 0)

    Comment.create(post: @post1, author: @user2, text: 'I enjoyed reading this.')
    Comment.create(post: @post2, author: @user1,
                   text: 'Looking forward to more posts!')
  end

  it "show the user's profile picture" do
    visit "/users/#{@user1.id}"
    expect(page).to have_selector("img[src*='#{@user1.photo}']")
  end

  it "show the user's picture picture" do
    visit "/users/#{@user1.id}"
    expect(page).to have_content(@user1.name)
  end

  it 'shows number of posts the user has written' do
    visit "/users/#{@user1.id}"
    expect(page).to have_content("Number of posts: #{@user1.posts_counter}")
  end

  it 'shows theuser\'s bio ' do
    visit "/users/#{@user1.id}"
    expect(page).to have_content(@user1.bio)
  end

  it 'shows three recent posts' do
    visit "/users/#{@user1.id}"
    expect(page).to have_content(@post1.text)
    expect(page).to have_content(@post3.text)
    expect(page).to have_content(@post5.text)
    expect(page).not_to have_content(@post4.text)
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
