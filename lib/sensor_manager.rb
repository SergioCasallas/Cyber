class SensorManager

  COLUMNS = %w(battle_id ship_id result time position)

  def self.transform_data_sensors_in_array(data_sensors)
    data_sensors.map { |sensor| sensor[1..-2].split("|") } if data_sensors.present?
  end

end
