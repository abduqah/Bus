class CreateInstitutions < ActiveRecord::Migration[5.1]
  def change
    create_table :institutions do |t|
      t.string :name
      t.string :location
      t.text :about

      t.timestamps
    end
  end
end
