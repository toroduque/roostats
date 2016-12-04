class CreateEarnings < ActiveRecord::Migration[5.0]
  def change
    create_table :earnings do |t|

      t.date "earnings_date", :null => false
      t.integer "hours", :null => false
      t.integer "orders", :null => false
      t.integer "tips"
      t.integer "rider_id"

      t.timestamps
    end
  end
end
