class DrinksController < ApplicationController
  
  def show
    @drink = Drink.find(params[:id])
    @action = "show_drink"
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
      flash[:success] = "#{@drink.name} Successfully Added!"
      redirect_to @drink
    else
      render 'new'
    end
  end
end