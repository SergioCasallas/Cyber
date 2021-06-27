class Api::V1::BattlesController < ApplicationController

  def create
    puts "=" * 200
    puts "#{payload_params}"
    puts "=" * 200
    BattleService.(payload_params)
  end

  private

  def payload_params
    params.permit(:payload)
  end
end
