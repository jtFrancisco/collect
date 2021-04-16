require "test_helper"

module Collect
  class OdkControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    test "should get index" do
      get odk_index_url
      assert_response :success
    end

  end
end
