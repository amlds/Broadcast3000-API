class RemoveDayFromChallenge < ActiveRecord::Migration[7.0]
  def change
    remove_column :challenges, :day, :date
  end
end
