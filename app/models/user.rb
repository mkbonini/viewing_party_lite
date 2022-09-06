# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates_presence_of :password
  has_secure_password

  has_many :user_view_party
  has_many :view_parties, through: :user_view_party
end
