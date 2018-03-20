class CreateDrivers < ActiveRecord::Migration[5.1]
  def change
    create_table :drivers do |t|
      t.integer :licence

      t.timestamps
    end
  end
end
