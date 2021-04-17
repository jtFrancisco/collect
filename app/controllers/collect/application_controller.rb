require_dependency "collect/application_controller"

module Collect
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

  end
end
