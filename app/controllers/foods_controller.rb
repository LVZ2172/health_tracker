class FoodsController < ApplicationController
  before_action :authenticate_user!, :except => [:index]

  def index
    @foods = Food.page(params[:page]).per(10)
  end

  def new
    @food = Food.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @food = Food.new(food_params)
    respond_to do |format|
      if @food.save
        flash[:notice] = "Food item added."
        format.html { redirect_to foods_path }
        format.js
      else
        flash[:alert] = "You failed."
        render :new
      end
    end
  end

  def edit
    @food = Food.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @food = Food.find(params[:id])
    respond_to do |format|
      if @food.update(food_params)
        flash[:notice] = "Food item edited."
        format.html { redirect_to foods_path }
        format.js
      else
        flash[:alert] = "You failed to edit."
        render :edit
      end
    end
  end

  def show
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    respond_to do |format|
      format.html { redirect_to foods_path }
      format.js
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :calories, :date_consumed)
  end
end
