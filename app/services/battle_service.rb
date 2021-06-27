module BattleService

  LIMIT = 30

  def self.call(data)
    create_sensors(data)
    battle_id = BattleManager.get_battle_id
    data_sensors = get_data_sensors(battle_id)
    data_json = build_data_json(data_sensors)
  end

  def self.create_sensors(data_battle)
    params = {
      table: "sensors",
      static_columns: {},
      aditional_columns: {},
      options: {
        timestamps: true,
      },
      group_size: 180_000,
      variable_columns: SensorManager::COLUMNS,
      values: SensorService.(data_battle)
    }
    inserter = FastInserter::Base.new(params)
    inserter.fast_insert
  end

  def self.get_data_sensors(battle_id)
    max_position = Sensor.where(battle_id: battle_id).maximum(:position)
    (1..max_position).map do |num|
      Sensor.where(battle_id: battle_id, position: num).order(time: :desc).limit(LIMIT)
    end
  end

  def self.build_data_json(data_sensors)
    {
      data: data_sensors.map do |data_sensor|
        count_ship = data_sensor.result_greather_than_or_equal_to(100).count
        count_damage = data_sensor.where(result: 0).count
        time = data_sensor.last.time
        id = data_sensor.pluck(:position).first
        {
          id: id,
          alert_timestamp: ([count_ship, count_damage].select { |number| number > 30 }.present? ? time : nil),
          alert_damage: count_damage > 30,
          alert_ship: count_ship > 30,
          data: data_sensor.map do |sensor|
            {
              timestamp: sensor.time,
              ship: sensor.ship&.name,
              number: sensor.result
            }
          end
        }
      end
    }
  end
end
