module Collect
  class OdkController < ApplicationController

    def index      
      @forms = Skooter::Form.order(:name)
      respond_to do |format|
        format.xml { render 'index.xml' }
      end
    end

    private

      def set_header
        response.headers['X-OpenRosa-Version'] = '1'
        response.headers['Content-Type'] = 'text/xml; charset=utf-8'
      end

  end
end
