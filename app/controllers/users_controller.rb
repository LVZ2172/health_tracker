class UsersController < ApplicationController

  def edit
    @foods = Food.all
    @exercises = Exercise.all
  end

  def update
    before_filter :authenticate_user!
    @foods = Food.exists?(params[:user][:foods])
    if @foods
      current_user.foods.push(Food.find(params[:user][:foods]))
    end

    @exercises = Exercise.exists?(params[:user][:exercises])
    if @exercises
      current_user.exercises.push(Exercise.find(params[:user][:exercises]))
    end

    respond_to do |format|
      if current_user.save
        flash[:notice] = "User updated"
        format.html { redirect_to user_path(current_user) }
        format.js
      else
        render :edit
      end
    end
  end

  def show
    @foods = current_user.foods.all
    @exercises = current_user.exercises.all
  end
end
