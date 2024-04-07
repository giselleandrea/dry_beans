# Toda informacion global o precargada se puede manejar desde este controlador. listas y/o recursos
# los modelos status y type_delivery se pre cargan desde seed.rb, alli se 
# puede modificar el contenido segun la necesidad    
class Api::V1::ListsController < ApplicationController
    
    # por defecto para estatus se estipiló:
    # { id: 1, status: "En ruta" }
    # { id: 2, status: "Completado" }
    # { id: 3, status: "Pendiente" }
    # { id: 4, status: "Recibido" }
    def all_status 
        @statuses = Status.all
        render json: @statuses
    end

    # por defecto para typeDelivery se estipiló:
    # { id: 1, typeDelivery: "Entrega" }
    # { id: 2, typeDelivery: "Retiro" }
    def all_type_delivery
        @type_deliveries = TypeDelivery.all
        render json: @type_deliveries
    end
end