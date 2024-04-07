#Modulo para respuestas de metodos. 

module Api
    module ResponseHelpers
        def render_success(message)
            render json: { message: message }, status: :created
        end

        def render_error(errors)
            render json: { errors: errors }, status: :unprocessable_entity
        end
    end
end