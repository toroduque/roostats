class AddTotalToEarnings < ActiveRecord::Migration[5.0]
  def change
    add_column :earnings, :total_earnings, :float
  end
end
