class RemovePasswordColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :riders, :password
  end
end
