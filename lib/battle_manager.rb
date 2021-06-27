require 'securerandom'

class BattleManager

  LIMIT_SECONDS = 90

  def self.transform_battle_in_array(battle)
    battle.split(",") if battle.present?
  end

  def self.get_battle_id
    battle = Battle.where(created_at: LIMIT_SECONDS.seconds.ago..Time.zone.now).first
    battle.present? ? battle.id : Battle.create(name: get_name).id
  end

  def self.get_name
    SecureRandom.hex(10)
  end

end
