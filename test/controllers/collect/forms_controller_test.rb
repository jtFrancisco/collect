require "test_helper"

module Collect
  class FormsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @form = collect_forms(:one)
    end

    test "should get index" do
      get forms_url
      assert_response :success
    end

    test "should get new" do
      get new_form_url
      assert_response :success
    end
    
    test "should get show" do
      get form_url(@form)
      assert_response :success
    end

    test "should get edit" do
      get edit_form_url(@form)
      assert_response :success
    end

  end
end
