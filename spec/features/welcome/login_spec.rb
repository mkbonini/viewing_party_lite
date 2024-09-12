# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'landing page' do
  it 'landing page has a button to login' do
    visit '/'

    click_on("Log In")

    expect(current_path).to eq("/login")
  end

  it 'has a login page to enter email and password' do
    
  end
end