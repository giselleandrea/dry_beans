class Api::V1::TripsController < ApplicationController
  include Api::ResponseHelpers

  #Mustra todos los trips relacionada con su ruta
  def show
    @trips = Trip.includes(:route).all
    render json: @trips, include: [:route]
  end

  # Muestra un trip por id
  def trip_show
    @trip = Trip.find(params[:id])
    render json: @trip
  end  

  # creacion de un trip
  def create
    @trip = Trip.new(trip_params)

    if @trip.save
      render_success("Viaje creado con éxito")
    else
      render_error(@trip.errors.full_messages)
    end
  end

  # actualizacion de un trip por id
  def update
    if @trip = Trip.update(trip_params)
      render json: @trip
    else
      render_error(@trip.errors.full_messages)
    end
  end

  # Eliminar un trip por id
  def delete
    if @trip = Trip.destroy
      render_success("Viaje eliminado exitosamente")
    else
      render_error(@trip.errors.full_messages) 
    end
  end

  private

  # Parametros para almacenar en Trip
  def trip_params
    startDate = Date.parse(params[:trip][:startDate])
    params.require(:trip).permit(:route_id, :nameTrip, :startDate)
  end

  # EJEMPLO DEL BODY PARA LOS POST
  #{
  #  "trip": {
  #    "route_id": "1",
  #    "nameTrip": "Viaje 1",
  #    "startDate": "2024-03-31"
  #  }
  #}


end
