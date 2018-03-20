class CreateLifts < ActiveRecord::Migration[5.1]
  def change
    create_table :lifts do |t|
      t.string :from_to
      t.string :location
      t.boolean :shareable

      t.timestamps
    end
  end
end
