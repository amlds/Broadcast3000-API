class ChangeStartEndDataTypeInBatches < ActiveRecord::Migration[7.0]
  def change
    change_column :batches, :start_at, :string
    change_column :batches, :end_at, :string
  end
end
