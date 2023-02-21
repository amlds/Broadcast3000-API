class CreateBatches < ActiveRecord::Migration[7.0]
  def change
    create_table :batches do |t|
      t.integer :number
      t.references :school, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true
      t.date :start_at
      t.date :end_at

      t.timestamps
    end
  end
end
