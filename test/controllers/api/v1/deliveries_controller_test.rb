require "test_helper"

class Api::V1::DeliveriesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get api_v1_deliveries_show_url
    assert_response :success
  end

  test "should create delivery" do
    assert_difference('Delivery.count') do
      post "/api/v1/deliveries/create", params: { delivery: { 
        trip_id: trips(:one).id,
        status_id: statuses(:one).id,
        type_delivery_id: type_deliveries(:one).id,
        description: 'Descripción del delivery',
        date: Date.today,
        location: 'Ubicación del delivery',
        customer: 'Cliente del delivery'
      } }
    end
  end

end
