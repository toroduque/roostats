class ContractsTimestampNullTrue < ActiveRecord::Migration[5.0]

  def up
    change_column(:contracts, :created_at, :datetime, :null => true)
    change_column(:contracts, :updated_at, :datetime, :null => true)
  end

  def down
    change_column(:contracts, :created_at, :datetime, :null => false)
    change_column(:contracts, :updated_at, :datetime, :null => false)
  end

end
