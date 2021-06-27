class SensorManager

  def self.transform_battle_in_array(battle)
    battle.split(",") if battle.present?
  end

  def self.transform_battle_in_array(data_battle)
    data_battle.map { |sensor| sensor[1..-2].split("|") }
  end

end
