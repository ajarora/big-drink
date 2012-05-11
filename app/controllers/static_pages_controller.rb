class StaticPagesController < ApplicationController
  
  def home
    @drinks = Drink.paginate(page: params[:page])
    
    # Get base API Connection
    @graph  = Koala::Facebook::GraphAPI.new(session[:access_token])

    # Get public details of current application
    @app  =  @graph.get_object(FACEBOOK_APP_ID)
    
    if session[:access_token]
      @user    = @graph.get_object("me")
      @friends = @graph.get_connections('me', 'friends')
      @photos  = @graph.get_connections('me', 'photos')
      @likes   = @graph.get_connections('me', 'likes').first(4)

    end
  end  
end
