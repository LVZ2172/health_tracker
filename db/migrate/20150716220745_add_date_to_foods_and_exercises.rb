class AddDateToFoodsAndExercises < ActiveRecord::Migration
  def change
    add_column :foods, :date_consumed, :datetime
    add_column :exercises, :date_performed, :datetime
  end
end
