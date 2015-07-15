class HomeController < ApplicationController
  def index
    @foods = Food.all
    @exercises = Exercise.all
  end
end
