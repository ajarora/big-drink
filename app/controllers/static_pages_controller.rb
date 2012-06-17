class StaticPagesController < ApplicationController
  
  def home
    @drinks = Drink.paginate(page: params[:page])
    @json = Venue.all.to_gmaps4rails
    
    if current_user
      # Get base API Connection
      @graph  ||= Koala::Facebook::GraphAPI.new(current_user.fb_access_token)

      # Get public details of current application
      @app  ||=  @graph.get_object(FACEBOOK_APP_ID)
      
      @fb_user    ||= @graph.get_object("me")
      @friends ||= @graph.get_connections('me', 'friends')
      @user ||= User.find_by_fb_uid(@fb_user['id'])
    end
    
  end  
end