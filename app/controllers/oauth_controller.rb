class OauthController < ApplicationController
  def redirect
    session[:access_token] = Koala::Facebook::OAuth.new("https://warm-snow-9881.herokuapp.com/oauth/redirect").get_access_token(params[:code]) if params[:code]

    redirect_to session[:access_token] ? success_path : failure_path
  end
end