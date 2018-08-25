class CreateBusinfos < ActiveRecord::Migration[5.1]
  def change
    create_table :businfos do |t|
      t.string :busID

      t.timestamps
    end
  end
end
