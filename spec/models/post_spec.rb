require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) do
    User.new(name: 'Ouail', photo: 'https://unsplash.com/photos/6dmx8YnkPGo', bio: 'This is my bio', posts_counter: '6')
  end

  before { user.save }

  subject do
    Post.create(title: 'Hello', text: 'Post text', comment_counter: '0', likes_counter: '0', author: user)
  end

  it 'validates presence of title' do
    subject.title = 'Hello'
    expect(subject).to be_valid
  end

  it 'validates absence of title' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'validates maximum length of title' do
    subject.title = 'Very long title' * 50
    expect(subject).to_not be_valid
  end

  it 'validates comments counter to be greater than or equal to 0' do
    subject.comment_counter = -5
    expect(subject).to_not be_valid
  end

  it 'validates comments counter to be equal to 0' do
    subject.comment_counter = 0
    expect(subject).to be_valid
  end

  it 'validates likes counter to be greater than or equal to 0' do
    subject.likes_counter = -5
    expect(subject).to_not be_valid
  end

  it 'validates likes counter to be equal to 0' do
    subject.likes_counter = 0
    expect(subject).to be_valid
  end

  it 'updates post counter' do
    expect { subject.author.increment!(:posts_counter) }.to change { subject.author.posts_counter }.by(1)
  end
end
