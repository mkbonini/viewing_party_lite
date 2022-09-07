# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users registration page' do
  it 'should have a form to enter name and email and password' do
    visit '/register'

    fill_in('Name', with: 'Nick')
    fill_in('email', with: '123@gmail.com')
    fill_in('password', with: '123test')
    fill_in('password_confirmation', with: '123test')

    click_on('Create New User')

    expect(current_path).to eq("/users/#{User.last.id}")
    expect(page).to have_content("Welcome, Nick!")
  end

  it 'should only accept unique email addresses' do
    user_1 = User.create!(name: 'Mike', email: 'email@email.com', password: '123test', password_confirmation: '123test')
    visit '/register'

    fill_in('Name', with: 'Nick')
    fill_in('email', with: 'email@email.com')
    fill_in('password', with: '123test')
    fill_in('password_confirmation', with: '123test')

    click_on('Create New User')

    expect(current_path).to eq('/users/new')
  end

  it 'returns you to the new page if all details arent submitted' do
    visit '/register'

    fill_in('email', with: 'Email@email.com')

    click_on('Create New User')

    expect(page.text).to have_content("Name can't be blank")
    expect(current_path).to eq('/users/new')
  end

  it 'returns to new page if passwords dont match' do
    visit '/register'

    fill_in('Name', with: 'Nick')
    fill_in('email', with: '123@gmail.com')
    fill_in('password', with: '123test')
    fill_in('password_confirmation', with: 'test123')

    click_on('Create New User')

    expect(current_path).to eq("/users/new")
    expect(page).to have_content("Password confirmation doesn't match Password")
  end

end
