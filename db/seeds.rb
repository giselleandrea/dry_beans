# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Estados posibles en el modelo Delivery
statuses = [
    { id: 1, status: "En ruta" },
    { id: 2, status: "Completado" },
    { id: 3, status: "Pendiente" },
    { id: 4, status: "Recibido" }
]

# Tipos del modelo Delivery
delivery_types = [
    { id: 1, typeDelivery: "Entrega" },
    { id: 2, typeDelivery: "Retiro" }
]

statuses.each do |status|
    Status.find_or_create_by(id: status[:id]) do |s|
        s.status = status[:status]
    end
end

delivery_types.each do |type|
    TypeDelivery.find_or_create_by(id: type[:id]) do |t|
        t.typeDelivery = type[:typeDelivery]
    end
end