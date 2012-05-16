class StaticPagesController < ApplicationController
  
  def home
    @drinks = Drink.paginate(page: params[:page])
    
    # Get base API Connection
    @graph  ||= Koala::Facebook::GraphAPI.new(session[:access_token])
    
    # Get public details of current application
    @app  ||=  @graph.get_object(FACEBOOK_APP_ID)
    
    if session[:access_token]
      @fb_user    ||= @graph.get_object("me")
      @friends ||= @graph.get_connections('me', 'friends')
      @user ||= User.find_by_fb_uid(@fb_user['id'])
      
      if @user
        if(@user.fb_access_token != session[:access_token])
          @user.fb_access_token = session[:access_token]
          @user.save
        end
      else # Create a new user in the db
        @user = User.create!(name:@fb_user['name'],
                            email: @fb_user['email'],
                            fb_uid: @fb_user['id'], 
                            fb_access_token: session[:access_token])
      end
    end
  end  
end