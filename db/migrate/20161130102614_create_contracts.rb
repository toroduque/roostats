class CreateContracts < ActiveRecord::Migration[5.0]
  def up
    create_table :contracts do |t|

      t.string "contract_type", :limit => 50, :null => false
      t.string "vehicle", :limit => 50, :null => false
      t.integer "salary_hour"
      t.integer "salary_dropoff"
      t.integer "rider_id"

      t.timestamps
    end
  end

  def down
    drop_table :contracts
  end

end
