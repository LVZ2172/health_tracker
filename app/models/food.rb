class Food < ActiveRecord::Base
  validates :name, :presence => true
  validates :calories, :presence => true
  belongs_to :user

  def self.search(search)
    if search
      where(['name ILIKE ?', "%#{search}%"])
    else
      all
    end
  end
end
