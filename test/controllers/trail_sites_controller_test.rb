require 'test_helper'

class TrailSitesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get trail_sites_index_url
    assert_response :success
  end

end
