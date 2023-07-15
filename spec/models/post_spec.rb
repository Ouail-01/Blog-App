require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) do
    User.new(Name: 'Ouail', Photo: 'https://unsplash.com/photos/6dmx8YnkPGo', Bio: 'This is my bio', PostsCounter: '6')
  end

  before { user.save }

  subject do
    Post.create(Title: 'Hello', Text: 'Post text', CommentsCounter: '0', LikesCounter: '0', author: user)
  end

  it 'validates presence of title' do
    subject.Title = 'Hello'
    expect(subject).to be_valid
  end

  it 'validates absence of title' do
    subject.Title = nil
    expect(subject).to_not be_valid
  end

  it 'validates maximum length of title' do
    subject.Title = 'Very long title' * 50
    expect(subject).to_not be_valid
  end

  it 'validates comments counter to be greater than or equal to 0' do
    subject.CommentsCounter = -5
    expect(subject).to_not be_valid
  end

  it 'validates comments counter to be equal to 0' do
    subject.CommentsCounter = 0
    expect(subject).to be_valid
  end

  it 'validates likes counter to be greater than or equal to 0' do
    subject.LikesCounter = -5
    expect(subject).to_not be_valid
  end

  it 'validates likes counter to be equal to 0' do
    subject.LikesCounter = 0
    expect(subject).to be_valid
  end

  it 'updates post counter' do
    expect { subject.author.increment!(:PostsCounter) }.to change { subject.author.PostsCounter }.by(1)
  end
end
