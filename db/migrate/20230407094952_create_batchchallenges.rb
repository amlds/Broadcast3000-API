class CreateBatchchallenges < ActiveRecord::Migration[7.0]
  def change
    create_table :batchchallenges do |t|
      t.references :batch, null: false, foreign_key: true
      t.references :challenge, null: false, foreign_key: true
      t.date :day

      t.timestamps
    end
  end
end
