require 'rails_helper'

RSpec.describe 'Renders the post show page', type: :feature do
  before :each do
    @user = User.create(Name: 'Ouail', Photo: 'https://www.linkedtour.com/images/lkavatar.png',
                        Bio: 'I am Micronaut, studying full stack development', PostsCounter: 0)
    @first_post = Post.create(Title: 'Microverse',
                              Text: 'Microverse online teaching school for those who want to be developers',
                              CommentsCounter: 2, LikesCounter: 10, author: @user)
    @second_post = Post.create(Title: 'Microverse', Text: 'The same post like the first one', CommentsCounter: 0,
                               LikesCounter: 5,
                               author: @user)
    2.times do |_i|
      Comment.create(Text: 'Nice post!!', author_id: @user.id, post_id: @first_post.id)
    end
    visit "/users/#{@user.id}/posts/#{@first_post.id}"
  end

  scenario 'displays the post title' do
    expect(page).to have_content(@first_post.Title)
  end

  scenario 'shows the person who wrote the post' do
    expect(page).to have_content('Ouail')
  end

  it 'can see the username of each commentor.' do
    expect(page).to have_content('Ouail')
  end

  scenario 'displays number of comments' do
    expect(page).to have_content('Comments: 2')
  end

  scenario 'displays number of likes' do
    expect(page).to have_content('Likes: 10')
  end

  scenario 'displays the content of the post' do
    expect(page).to have_content(@first_post.Text)
  end

  scenario 'can see the comments of each commentor.' do
    expect(page).to have_content 'Nice post!!'
    expect(page).to have_content 'Nice post!!'
  end
end