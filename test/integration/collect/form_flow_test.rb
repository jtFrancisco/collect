require "test_helper"

module Collect
  class FormFlowTest < ActionDispatch::IntegrationTest

    test "can see the forms index page" do
      get '/collect/forms'
      assert_response :success
    end

  end
end
