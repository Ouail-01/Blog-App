require 'rails_helper'

RSpec.describe 'Visit home page', type: :system do
  before do
    @user1 = User.create(Name: 'Test User1',
                         Photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                         Bio: 'Test bio 1.',
                         PostsCounter: 0)
    @user2 = User.create(Name: 'Test User2',
                         Photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                         Bio: 'Test bio 2.',
                         PostsCounter: 0)

    @users = User.all
    visit '/users'
  end

  describe 'index page' do
    it 'shows the name of all users' do
      visit '/users'
      @users.each do |user|
        expect(page).to have_content(user.Name)
      end
    end

    it 'display the profile picture for each user' do
      visit '/users'
      @users.each do |user|
        expect(page).to have_selector("img[src='#{user.Photo}']")
      end
    end

    it 'displays number of posts each user has written' do
      visit '/users'
      @users.each do |user|
        expect(page).to have_content "Number of posts: #{user.PostsCounter}"
      end
    end

    it 'shows the username of all other users' do
      visit '/users'
      expect(page).to have_content(@user1.Name)
      sleep(2)
    end
  end
end
