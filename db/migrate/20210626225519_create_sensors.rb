class CreateSensors < ActiveRecord::Migration[6.1]
  def change
    create_table :sensors do |t|
      t.integer :result
      t.datetime :time
      t.integer :order

      t.timestamps
    end
  end
end
