require 'test_helper'

class GreenRoomControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get green_room_show_url
    assert_response :success
  end

end
