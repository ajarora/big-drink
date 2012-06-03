class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_filter :correct_user,   only: [:edit, :update]
  
  def index
    @users = User.paginate(page: params[:page])
  end
    
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "<strong>Success!</strong>Your profile has been updated.".html_safe
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  
  private
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
end