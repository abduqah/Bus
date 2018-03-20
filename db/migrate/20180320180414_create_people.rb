class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.integer :nid
      t.string :name
      t.string :email
      t.integer :phoneN
      t.string :live_in
      t.timestamp :bd

      t.timestamps
    end
  end
end
