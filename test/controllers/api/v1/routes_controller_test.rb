require "test_helper"

class Api::V1::RoutesControllerTest < ActionDispatch::IntegrationTest

  setup do
    @route = routes(:one)
  end

  test "should get show" do
    get '/api/v1/routes/show', as: :json
    assert_response :success
  
    data_json = JSON.parse(response.body)
    puts JSON.pretty_generate(data_json)
  
    route_data = data_json["routes"].first
  
    assert_equal @route.id, route_data["route_id"]
    assert_equal @route.nameRoute, route_data["nameRoute"]
    assert_equal @route.startRoute, route_data["startRoute"]
  
    assert_equal @route.trips.count, route_data["trips"].length
  
    route_data["trips"].each_with_index do |trip_data, i|
      trip = @route.trips[i]
  
      assert_equal trip.id, trip_data["trip_id"]
      assert_equal trip.nameTrip, trip_data["nameTrip"]
      assert_equal trip.startDate.strftime("%Y-%m-%d"), trip_data["startDate"]
  
      assert_equal trip.deliveries.count, trip_data["deliveries"].length
  
      trip_data["deliveries"].each_with_index do |delivery_data, j|
        delivery = trip.deliveries[j]
  
        assert_equal delivery.id, delivery_data["delivery_id"]
        assert_equal delivery.status&.status || "No Status Available", delivery_data["status"]
        assert_equal delivery.type_delivery&.typeDelivery || "No Type Delivery Available", delivery_data["type_delivery"]
        assert_equal delivery.description, delivery_data["description"]
        assert_equal delivery.date.strftime("%Y-%m-%d"), delivery_data["date"]
        assert_equal delivery.location, delivery_data["location"]
        assert_equal delivery.customer, delivery_data["customer"]
      end
    end
  end
    
  test "should create route" do
    route_params = {
      nameRoute: "Nombre de la ruta",
      startRoute: "Inicio de la ruta",
      endRoute: "Fin de la ruta"
    }
    assert_difference('Route.count', 1) do
      post "/api/v1/routes/create", params: { route: route_params }
    end
    assert_response :success
  end


end
