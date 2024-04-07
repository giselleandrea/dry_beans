class Status < ApplicationRecord
    has_many :deliveries

    # CAMPO               TIPO DE DATO 
    #
    # id                  =   INT
    # status              =   STRING
    # created_at          =   DATETIME
    # updated_at          =   DATETIME
    
end