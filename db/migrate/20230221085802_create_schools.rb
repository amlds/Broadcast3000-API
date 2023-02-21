class CreateSchools < ActiveRecord::Migration[7.0]
  def change
    create_table :schools do |t|
      t.string :display_path
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
