class Api::V1::StationsController < ApplicationController
  skip_before_action :require_login, only: [:index]

  def index
    stations = Station.all
    render json: stations
  end

  private

  def station_params
    params.require(:station).permit(:name, :zone)
  end
end
