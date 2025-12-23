class VehiclesController < ApplicationController
  def index
    @vehicles = Vehicle.all
    @vehicles = @vehicles.where(vehicle_type: params[:type]) if params[:type].present?
  end
  
  def show
    @vehicle = Vehicle.find(params[:id])
  end
end
