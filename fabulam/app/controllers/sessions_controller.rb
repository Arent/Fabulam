class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to "http://localhost:3000/journeys"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end