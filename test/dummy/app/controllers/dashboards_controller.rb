class DashboardsController < ApplicationController

  def index
    @forms = Collect::Form.order(created_at: :desc)
  end

end
