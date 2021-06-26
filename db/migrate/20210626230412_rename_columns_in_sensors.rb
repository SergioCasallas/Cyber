class RenameColumnsInSensors < ActiveRecord::Migration[6.1]
  def change
    rename_column :sensors, :battles_id, :battle_id
    rename_column :sensors, :ships_id, :ship_id
  end
end
