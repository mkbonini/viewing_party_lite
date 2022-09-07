# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def discover
    @user = User.find(params[:id])
  end

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to "/users/#{user.id}"
      flash[:success] = "Welcome, #{user.name}!"
    else
      redirect_to '/users/new'
      flash[:alert] = 'Error: Please fill in all fields.  Email must be unique.'
    end
  end

  def login_form
  end

  def login_user
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      redirect_to user_path(user.id)
    else
      redirect_to '/login'
      flash[:error] = 'Invalid Username or Password'
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
