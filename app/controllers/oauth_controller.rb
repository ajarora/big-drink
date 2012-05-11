class OauthController < ApplicationController
  def redirect
    session[:access_token] = Koala::Facebook::OAuth.new("https://localhost:3000/oauth/redirect").get_access_token(params[:code]) if params[:code]

    redirect_to session[:access_token] ? success_path : failure_path
  end
end