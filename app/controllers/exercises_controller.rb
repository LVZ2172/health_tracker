class ExercisesController < ApplicationController
  def index
    @exercises = Exercise.all
  end

  def new
    @exercise = Exercise.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @exercise = current_user.exercises.new(exercise_params)
    respond_to do |format|
      if @exercise.save
        format.html { redirect_to exercises_path}
        format.js
      else
        render :new
      end
    end
  end

  def show
  end

  def edit
    @exercise = Exercise.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @exercise = current_user.exercises.find(params[:id])
    respond_to do |format|
      if @exercise.update(exercise_params)
        format.html { redirect_to exercises_path}
        format.js
      else
        render :new
      end
    end
  end

  def destroy
    @exercise = Exercise.find(params[:id])
    @exercise.destroy
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def exercise_params
    params.require(:exercise).permit(:name, :calories)
  end
end
