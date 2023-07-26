require 'rails_helper'

describe 'GET /users' do
  it 'returns a successful response' do
    get '/users'
    expect(response).to be_successful
    expect(response.body).to include('<body>')
    expect(response).to render_template(:index)
  end
end

describe 'GET /users/:id' do
  it 'is a success' do
    user = User.create!(Name: 'Test User', PostsCounter: 0)
    get "/users/#{user.id}"
    expect(response).to have_http_status(:ok)
  end

  it 'returns a successful response' do
    user = User.create!(Name: 'Test User', PostsCounter: 0)
    get "/users/#{user.id}"

    expect(response).to be_successful
    expect(response.body).to include('<h2>Bio</h2>')
    expect(response).to render_template(:show)
  end
end