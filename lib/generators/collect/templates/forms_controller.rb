module Collect
  class FormsController < ApplicationController
    # use the check_access method to control access to the forms controller
    # before_action :check_access

    include Collect::BaseFormsControllerActions
    layout 'collect/application'
    respond_to :html

    private

    def check_access
      return if current_user.permission_level == 'super_admin'

      flash[:notice] = t('collect.access_denied')
      redirect_to root_path
    end
  end
end
