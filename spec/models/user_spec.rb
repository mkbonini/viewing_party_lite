require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_uniqueness_of(:email)}
    it { should validate_presence_of(:password) }
    it { should have_secure_password }
  end

  describe 'relationships' do
    it { should have_many :user_view_party }
    it { should have_many(:view_parties).through(:user_view_party) }
  end

  describe 'class methods' do
  end
end