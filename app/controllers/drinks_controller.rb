class DrinksController < ApplicationController
  before_filter :admin_user, only: [:new, :create, :edit, :update, :destroy]
  
  def show
    @drink = Drink.find(params[:id])
    @action = "show_drink"
  end
  
  def edit
    @drink = Drink.find(params[:id])
  end
  
  def new
    @drink = Drink.new(@drink)
  end
  
  def index
    @drinks = Drink.paginate(page: params[:page])
  end

  def create
    @drink = Drink.new(params[:drink])
    if @drink.save
      flash[:success] = "<strong>Aw yeea.</strong> #{@drink.name} successfully added.".html_safe
      redirect_to @drink
    else
      render 'new'
    end
  end
end