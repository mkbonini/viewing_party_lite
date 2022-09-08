# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      redirect_to '/login'
      flash[:error] = 'Invalid Username or Password'
    end
  end

  def destroy
    session.destroy
    redirect_to "/"
  end
end