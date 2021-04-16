module Collect
  class FormsController < ApplicationController

    # before_action :cannot_access

    include Collect::BaseFormsControllerActions
    layout 'collect/application'
    respond_to :html

    private

    # def cannot_access
    #   unless current_user.is_super_admin == true
    #     flash[:notice] = t("shared.access_denied")
    #     redirect_to "https://www.google.com"
    #   end
    # end

  end
end
