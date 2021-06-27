class RenameOrderToPositionInSensor < ActiveRecord::Migration[6.1]
  def change
    rename_column :sensors, :order, :position
  end
end
