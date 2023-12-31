require 'rails_helper'

RSpec.describe 'Renders the post show page', type: :feature do
  before :each do
    @user = User.create(name: 'Ouail', photo: 'https://www.linkedtour.com/images/lkavatar.png',
                        bio: 'I am Micronaut, studying full stack development', posts_counter: 0)
    @first_post = Post.create(title: 'Microverse',
                              text: 'Microverse online teaching school for those who want to be developers',
                              comment_counter: 2, likes_counter: 10, author: @user)
    @second_post = Post.create(title: 'Microverse', text: 'The same post like the first one', comment_counter: 0,
                               likes_counter: 5,
                               author: @user)
    2.times do |_i|
      Comment.create(text: 'Nice post!!', author_id: @user.id, post_id: @first_post.id)
    end
    visit "/users/#{@user.id}/posts/#{@first_post.id}"
  end

  scenario 'displays the post title' do
    expect(page).to have_content(@first_post.title)
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
    expect(page).to have_content(@first_post.text)
  end

  scenario 'can see the comments of each commentor.' do
    expect(page).to have_content 'Nice post!!'
    expect(page).to have_content 'Nice post!!'
  end
end
