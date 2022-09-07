# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'landing page' do
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
end