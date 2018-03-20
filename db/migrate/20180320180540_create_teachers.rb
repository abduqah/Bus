class CreateTeachers < ActiveRecord::Migration[5.1]
  def change
    create_table :teachers do |t|
      t.string :degree
      t.string :position
      t.timestamps
    end
  end
end
