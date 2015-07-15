class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, :presence => true
  has_many :foods
  has_many :exercises
  
  def total_calories
    total = (self.foods.sum(:calories)) - (self.exercises.sum(:calories))
  end
end
