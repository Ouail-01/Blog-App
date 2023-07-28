require 'rails_helper'

RSpec.describe 'Visit home page', type: :system do
  before do
    @user1 = User.create(name: 'Test User1',
                         photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                         bio: 'Test bio 1.',
                         posts_counter: 0)
    @user2 = User.create(name: 'Test User2',
                         photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                         bio: 'Test bio 2.',
                         posts_counter: 0)

    @users = User.all
    visit '/users'
  end

  describe 'index page' do
    it 'shows the name of all users' do
      visit '/users'
      @users.each do |user|
        expect(page).to have_content(user.name)
      end
    end

    it 'display the profile picture for each user' do
      visit '/users'
      @users.each do |user|
        expect(page).to have_selector("img[src='#{user.photo}']")
      end
    end

    it 'displays number of posts each user has written' do
      visit '/users'
      @users.each do |user|
        expect(page).to have_content "Number of posts: #{user.posts_counter}"
      end
    end

    it 'shows the username of all other users' do
      visit '/users'
      expect(page).to have_content(@user1.name)
      sleep(2)
    end

    it 'redirect to the users show page when you click on a user' do
      visit '/users'
      click_on @user1.name
      expect(page).to have_current_path("/users/#{@user1.id}")
    end
  end
end
