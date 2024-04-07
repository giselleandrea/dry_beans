class Delivery < ApplicationRecord
  belongs_to :trip
  belongs_to :status
  belongs_to :type_delivery
  after_update :handle_status_change

  # CAMPO               TIPO DE DATO 
  #
  # id                  =   INT
  # trip_id             =   INT
  # status_id           =   INT
  # type_delivery_id    =   INT
  # description         =   STRING
  # date                =   DATE
  # location            =   STRING
  # customer            =   STRING
  # created_at          =   DATETIME
  # updated_at          =   DATETIME

  validates :description, presence: true
  validates :date, presence: true
  validates :location, presence: true
  validates :customer, presence: true

  # Eventos que se pueden usar para actualizar los estados de las entregas/retiros, 
  # para notificar (sms, email, etc) usando jobs. 
  def handle_status_change
    new_status_id = self.status_id
    puts "El estado del delivery se ha actualizado a: #{new_status_id}"
  end

=begin

  COMPLEMENTOS DEEL MODELO Y DESCRIPCION DE LOS CAMPOS 

  - Delivery esta relacionado con trip.
  - Se relaciona con la tabla estatus y type_delivery (dichos modelos
  se alimentan desde seed.rb) con el fin de que se pueda precargar 
  elementos o listados.

  modelo:
    trip_id = relacion con el modelo trip
    status_id = estado del pedido "En ruta", "Completado", "Pendiente", "Recibido". 
    type_delivery_id = especificacion del tipo "Entrega", "Retiro"  
    description = descripcion de la entrega/retiro 
    date= fecha de cuando se va a realizar entrega/retiro 
    location= pude referirse a una direccion, zona etc.
    customer= informacion del cliente o persona con quien se debe tratar la entrega o retiro. 

=end
  

end
