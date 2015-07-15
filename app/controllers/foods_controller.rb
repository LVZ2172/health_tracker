class FoodsController < ApplicationController
  def index
    @foods = Food.all
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

  private

  def food_params
    params.require(:food).permit(:name, :calories)
  end
end
