class SessionsController < ApplicationController
  def create
      auth = request.env["omniauth.auth"]
      user = User.find_by_fb_uid(auth["uid"]) || User.create_with_omniauth(auth)
      session[:user_id] = user.id
      flash[:success] = "<strong>Welcome #{user.name.split(/ /)[0]}!</strong> You are now signed in.".html_safe
      redirect_back_or root_url
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "<strong>Signed out successfully.</strong> Please come back soon!".html_safe
    redirect_to root_url
  end
end