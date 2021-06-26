class Api::V1::BattlesController < ApplicationController

  def create
  end

  private

  def payload_params
    params.permit(:payload)
  end

end
