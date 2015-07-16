class CreateFoodsAndExercisesJoinTableWithUsers < ActiveRecord::Migration
  def change
    create_table :foods_users do |t|
      t.belongs_to :food, index: true
      t.belongs_to :user, index: true
    end

    create_table :exercises_users do |t|
      t.belongs_to :exercise, index: true
      t.belongs_to :user, index: true
    end

    remove_column :foods, :user_id
    remove_column :exercises, :user_id
  end
end
