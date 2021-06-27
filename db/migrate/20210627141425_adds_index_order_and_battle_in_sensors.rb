class AddsIndexOrderAndBattleInSensors < ActiveRecord::Migration[6.1]
  def change
    add_index :sensors, [:battle_id, :order]
  end
end
