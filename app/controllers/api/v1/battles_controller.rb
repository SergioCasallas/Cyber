class Api::V1::BattlesController < ApplicationController

  def create
    BattleService.(payload_params)
  end

  private

  def payload_params
    params.permit(:payload).deep_transform_keys { |key| key.to_sym }
  end
end
