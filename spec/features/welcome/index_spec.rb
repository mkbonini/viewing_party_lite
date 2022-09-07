# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'landing page' do
  it 'has a button to create a new user' do
    visit '/'

    expect(page).to have_button('Create a New User')
  end

  it 'the button links to page to create a new user' do
    visit '/'
    click_on('Create a New User')

    expect(current_path).to eq('/users/new')
  end

  it 'has a list of existing users' do
    user_1 = User.create!(name: 'Mike', email: 'email@email.com', password: '123test')
    user_2 = User.create!(name: 'Nick', email: '123@email.com', password: '123test')

    visit '/'

    within('#existing-users') do
      expect(page).to have_content("email@email.com's Dashboard")
      expect(page).to have_content("123@email.com's Dashboard")
    end
    expect(User.all).to match_array([user_1, user_2])
    expect(User.count).to eq(2)
  end

  it 'users emails link to user show page' do
    user_1 = User.create!(name: 'Mike', email: 'email@email.com', password: '123test')

    visit '/'

    click_on("email@email.com's Dashboard")

    expect(current_path).to eq("/users/#{user_1.id}")
  end

  it ' has a link to to the landing page' do
    visit '/'

    click_on('Home')

    expect(current_path).to eq('/')
  end

  it ' shows the app title' do
    visit '/'

    expect(page).to have_content('Viewing Party Light')
  end
end
