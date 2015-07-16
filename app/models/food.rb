class Food < ActiveRecord::Base
  validates :name, :presence => true
  validates :calories, :presence => true
  has_and_belongs_to_many :users

  def self.search(search)
    if search
      where(['name ILIKE ?', "%#{search}%"])
    else
      all
    end
  end
end
