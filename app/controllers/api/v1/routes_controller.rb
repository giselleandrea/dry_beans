class Api::V1::RoutesController < ApplicationController
  include Api::ResponseHelpers

  # Muestra todas las rutas con sus respectivos viajes y sus entregas/retiros 
  def show
    @routes = Route.all.includes(trips: :deliveries)

    data_json ={
      routes: @routes.map do |route| {
          route_id: route.id,
          nameRoute: route.nameRoute,
          startRoute: route.startRoute,

          trips: route.trips.map do |trip| {
              trip_id: trip.id,
              nameTrip: trip.nameTrip,
              startDate: trip.startDate.strftime("%Y-%m-%d"),

              deliveries: trip.deliveries.map do |delivery| {
                  delivery_id: delivery.id,
                  status: delivery.status&.status || "No Status Available",
                  type_delivery: delivery.type_delivery&.typeDelivery || "No Type Delivery Available",
                  description: delivery.description,
                  date: delivery.date.strftime("%Y-%m-%d"),
                  location: delivery.location,
                  customer: delivery.customer
                }
              end
            }
          end
        }
      end
    }
    render json: data_json
  end

  # Muestra la ruta y sus respectivos viajes, por id de ruta (id) y 
  # toda la informacion de entregas/retiros 
  # si una ruta tiene varios viajes muestra todos los que pertenecen a ella. 
  def route_trip
    @route = Route.find(params[:id])
    @trips = @route.trips.includes(deliveries: [:status, :type_delivery])

    data_json = {
      route: {
        route_id: @route.id,
        nameRoute: @route.nameRoute,
        startRoute: @route.startRoute,

        trip: @route.trips.map do |trip| {
            trip_id: trip.id,
            nameTrip: trip.nameTrip,
            startDate: trip.startDate.strftime("%Y-%m-%d"),
            
            deliveries: trip.deliveries.map do |delivery| {
                delivery_id: delivery.id,
                status: delivery.status.status,
                type_delivery: delivery.type_delivery.typeDelivery,
                description: delivery.description,
                date: delivery.date.strftime("%Y-%m-%d"),
                location: delivery.location,
                customer: delivery.customer,
              }
            end
          }
        end
      }  
    }
    render json: data_json
  end

  # Creacion de una ruta 
  def create
    @route = Route.new(route_params)

    if @route.save
      render_success("Ruta creada con éxito")
    else
      render_error(@route.errors.full_messages)
    end
  end

  # Actualizacion de una ruta por Id
  def update
    if @route = Route.update(route_params)
      render json: @route
    else
      render_error(@route.errors.full_messages)
    end
  end

  # Elimina una ruta por id
  def delete
    if @route = Route.destroy
      render_success("Ruta eliminado exitosamente")
    else
      render_error(@route.errors.full_messages) 
    end
  end

  private

  #Parametros para almacenar en Route
  def route_params
      params.require(:route).permit(:nameRoute, :startRoute, :endRoute)
  end

  # EJEMPLO DEL BODY PARA LOS POST
  #{
  #  "route": {
  #    "nameRoute": "Primera ruta",
  #    "startRoute": "Zona 1",
  #    "endRoute": "Zona 2"
  #  }
  #}


end
