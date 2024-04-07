class Route < ApplicationRecord
    has_many :trips, dependent: :destroy

    # CAMPO               TIPO DE DATO 
    #
    # id                  =   INT
    # nameRoute           =   STRING
    # startRoute          =   STRING
    # endRoute            =   STRING
    # created_at          =   DATETIME
    # updated_at          =   DATETIME

    validates :nameRoute, presence: true
    
end
