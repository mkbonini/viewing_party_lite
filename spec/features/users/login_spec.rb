# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'login page' do
  it 'landing page has a button to login' do
    visit '/'
    
    click_on("Log In")

    expect(current_path).to eq("/login")
  end

  it 'has a login page to enter email and password' do
    user = User.create!(name: 'ODB', email: 'testemail@mail.com', password: '123test', password_confirmation: '123test')

    visit '/login'

    fill_in('email', with: 'testemail@mail.com')
    fill_in('password', with: '123test')

    click_on('Log In')

    expect(current_path).to eq("/users/#{user.id}")
  end

  it 'returns to login with invalid password' do
    user = User.create!(name: 'ODB', email: 'testemail@mail.com', password: '123test', password_confirmation: '123test')

    visit '/login'

    fill_in('email', with: 'testemail@mail.com')
    fill_in('password', with: 'test')

    click_on('Log In')

    expect(current_path).to eq("/login")
    expect(page).to have_content("Invalid Username or Password")
  end

  it 'returns to login with invalid email' do
    user = User.create!(name: 'ODB', email: 'testemail@mail.com', password: '123test', password_confirmation: '123test')

    visit '/login'

    fill_in('email', with: 'email@mail.com')
    fill_in('password', with: '123test')

    click_on('Log In')

    expect(current_path).to eq("/login")
    expect(page).to have_content("Invalid Username or Password")
  end
end