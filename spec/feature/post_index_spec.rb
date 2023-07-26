require 'rails_helper'

RSpec.describe 'Render post index page', type: :feature do
  before :each do
    @user = User.create(Name: 'Adhola', Photo: 'https://www.linkedtour.com/images/lkavatar.png',
                        Bio: 'I am Micronaut, studying full stack development', PostsCounter: 0)
    @first_post = Post.create(Title: 'Microverse',
                              Text: 'Microverse online teaching school for those who want to be developers',
                              CommentsCounter: 0, LikesCounter: 10, author: @user)
    @second_post = Post.create(Title: 'Microverse', Text: 'The same post like the first one', CommentsCounter: 0,
                               LikesCounter: 5,
                               author: @user)
    5.times do |_i|
      Comment.create(Text: 'Nice post!!', author_id: @user.id, post_id: @first_post.id)
    end
    visit "/users/#{@user.id}/posts"
  end

  scenario 'displays post text' do
    expect(page).to have_content('Microverse online teaching school for those who want to be developers')
  end

  scenario 'display the post title' do
    expect(page).to have_content(@first_post.Title)
  end

  scenario 'display the post body' do
    expect(page).to have_content(@first_post.Text)
  end

  scenario 'display the first comment on a post' do
    expect(page).to have_content('Microverse')
  end

  scenario 'display the how many comments' do
    expect(page).to have_content('Comments: 0')
  end

  scenario 'display the how many Likes' do
    expect(page).to have_content('Likes: 5')
  end

  scenario "when click on a post, it redirects to the post's show page" do
    expect(page).to have_content(@first_post.Title)
  end

  it 'shows the users profile picture' do
    img = find('.user-img')
    expect(img[:src]).to have_content(@user.Photo)
  end

  it 'shows the users username' do
    expect(page).to have_content(@user.Name)
  end

  it 'shows the number of posts the user has written' do
    expect(page).to have_content('Number of posts: 0')
  end
end
