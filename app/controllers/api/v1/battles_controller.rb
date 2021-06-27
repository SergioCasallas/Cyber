class Api::V1::BattlesController < ApplicationController

  def create
    BattleService.(data_params["data"])
  end

  private

  def data_params
    params.permit(:data).deep_transform_keys { |key| key.to_sym }
  end
end
