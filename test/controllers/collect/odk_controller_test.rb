require "test_helper"

module Collect
  class OdkControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @form = collect_forms(:one)
    end

    test "should get formList" do
      get "/collect/formList"
      assert_response :success
    end

    test "should get show" do
      get "/collect/odk/#{@form.id}"
      assert_response :success
    end

    test "should get submission" do
      get "/collect/submission"
      assert_response :success
    end

  end
end
