class CreateSalaries < ActiveRecord::Migration[5.0]
  def change
    create_table :salaries do |t|
        t.string :contract_type
        t.float :salary_hourly
        t.float :salary_per_dropoff
      t.timestamps
    end
  end
end
