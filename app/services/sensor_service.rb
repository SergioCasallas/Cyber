module SensorService

  def self.call(data_battle)
    data_battle_array = transform_battle_in_array(data_battle)
    time, data_battle_array = get_time(data_battle_array)
    data_sensor = transform_data_sensors_in_array(data_battle_array)
    data_sensor.map.with_index do |(ship, result), _index|
      [
        get_battle_id,
        get_ship_id(ship),
        get_result(result),
        time,
        _index + 1
      ]
    end
  end

  def self.transform_battle_in_array(battle = nil)
    BattleManager.transform_battle_in_array(battle)
  end

  def self.get_time(data_array = nil)
    time = Time.parse(data_array.delete_at(0)) if data_array.present?
    [time, data_array]
  end

  def self.transform_data_sensors_in_array(data_sensors = nil)
    SensorManager.transform_data_sensors_in_array(data_sensors)
  end

  def self.get_battle_id
    BattleManager.get_battle_id
  end

  def self.get_ship_id(ship)
    Ship.find_by(name: ship)&.id
  end

  def self.get_result(result)
    result.to_i
  end
end
