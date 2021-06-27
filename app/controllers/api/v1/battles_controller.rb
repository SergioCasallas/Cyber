class Api::V1::BattlesController < ApplicationController

  def create
    puts "#" * 100
    puts "#{data_params}"
    puts "#" * 100
    BattleService.(data_params)
  end

  private

  def data_params
    params.permit(:data).deep_transform_keys { |key| key.to_sym }
  end
end
