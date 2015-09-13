class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.integer :manufacturer_id, null: false
      t.float :size
      t.float :cut_out
      t.string :model_no
      t.string :link
      t.float :ohms
      t.integer :rms_power
      t.integer :sensitivity
      t.float :x_max
      t.float :fs
      t.float :vas
      t.float :qts
      t.integer :low_frequency_limit
      t.integer :high_frequency_limit
      t.float :sealed_volume
      t.integer :sealed_f3
      t.float :vented_volume
      t.integer :vented_f3
    end
    add_index :drivers, :manufacturer_id
  end
end
