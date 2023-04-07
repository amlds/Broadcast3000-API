class AddDayToChallenge < ActiveRecord::Migration[7.0]
  def change
    add_column :challenges, :day, :date
  end
end
