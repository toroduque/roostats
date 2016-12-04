class CreateRiders < ActiveRecord::Migration[5.0]
  def up
    create_table :riders do |t|

      t.string "first_name", :limit => 50, :null => false
      t.string "last_name", :limit => 50, :null => false
      t.string "city", :limit => 50
      t.string "email", :limit => 255, :null => false
      t.string "password", :limit => 50, :null => false

      t.timestamps
    end
  end

  def down
    drop_table :riders
  end
  
end
