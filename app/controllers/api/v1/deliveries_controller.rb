class Api::V1::DeliveriesController < ApplicationController
  include Api::ResponseHelpers

  # Informacion de todos los deliveries
  def show
    @deliveries = Delivery.includes(:status, :type_delivery).all
    render json: @deliveries, include: [:status, :type_delivery]
  end

  #Creacion de delivery
  def create
    @delivery = Delivery.new(delivery_params)
    
    if @delivery.save
      render_success("Datos de entrega guardados")
    else
      render_error(@delivery.errors.full_messages)
    end
  end

  # Cambio de estad de un delivery ("id", "new_status_id")
  # ambos son tipo de dato Int, se realciona con el modelo status y se asigna el id correspondiente. 
  # Todo listado o informacion precargada se maneja desde list_controller.rb para un control mas optimo al integrar.
  def change_status
    @delivery = Delivery.find(params[:id])
    new_status_id = params[:new_status_id]

    if @delivery.update(status_id: new_status_id)
      render_success("Estado del delivery actualizado")
    else
      render_error(@delivery.errors.full_messages)
    end
  end

  #Edicion por id. 
  def update
    if @delivery = Delivery.update(delivery_params)
      render json: @delivery
    else
      render_error(@route.errors.full_messages)
    end
  end

  #Eliminar por id
  def delete
    if @delivery = Delivery.destroy
      render_success("Delivery eliminado exitosamente")
    else
      render_error(@delivery.errors.full_messages) 
    end
  end

  private

  #Parametros para almacenar delivery
  def delivery_params
    date = Date.parse(params[:delivery][:date])
    params.require(:delivery).permit(:trip_id, :status_id, :type_delivery_id, :description, :date, :location, :customer)
  end

  # EJEMPLO DEL BODY PARA LOS POST
  #{
  #  "delivery": {
  #    "trip_id": 1,
  #    "status_id": 1,
  #    "type_delivery_id": 1,
  #    "description": "desc entrega 1",
  #    "date": "2024-03-31",
  #    "location": "lugar 1",
  #    "customer": "Nombre cliente"
  #  }
  #}

end
