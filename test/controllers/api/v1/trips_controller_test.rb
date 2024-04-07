require "test_helper"

class Api::V1::TripsControllerTest < ActionDispatch::IntegrationTest
  
  test "should create trip" do
    route = routes(:one)
    trip_params = {
      route_id: route.id, 
      nameTrip: "Nombre del viaje",
      startDate: Date.today      
    }
    assert_difference('Trip.count', 1) do
      post "/api/v1/trips/create", params: { trip: trip_params }
    end
    assert_response :success
  end

end
