class Trip < ApplicationRecord
  belongs_to :route
  has_many :deliveries, dependent: :destroy

  # CAMPO               TIPO DE DATO 
  #
  # id                  =   INT
  # route_id            =   INT
  # nameTrip            =   STRING
  # startDate           =   STRING
  # created_at          =   DATETIME
  # updated_at          =   DATETIME

  validates :nameTrip, presence: true
  validates :startDate, presence: true
end
