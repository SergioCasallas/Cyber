class AddsReferencesToSensors < ActiveRecord::Migration[6.1]
  def change
    add_reference :sensors, :battles, foreign_key: true
    add_reference :sensors, :ships
  end
end
