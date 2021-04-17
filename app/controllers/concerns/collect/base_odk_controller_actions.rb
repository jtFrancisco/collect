module Collect
  module BaseOdkControllerActions
    extend ActiveSupport::Concern

    def self.included(base)
      base.before_action :set_header, only: %i[index submission]
      base.respond_to :xml
    end

    ## The index action lets ODK Collect get a list of forms from your app
    ## See this line in config/routes: get 'formList', to: 'odk#index', as: :odk, defaults: { format: 'xml' }
    ## It works like this:
    ## When a user selects "Get forms" in ODK Collect, ODK Collect sends a get request to this action
    ## Each form in the list of foms has a <downloadUrl/> tag 
    ## This tag lets ODK Collect know to look for the xml document in the show action below when the user clicks "Download blank forms" in ODK Collect
    #
    ## To see the xml layout of each form see:
    ## views/collect/odk/index.xml.erb 
    def index
      @forms = Collect::Form.all
      respond_to do |format|
        format.xml { render 'index.xml' }
      end
    end

    ## The show action lets ODK Collect download the xml form from your server
    ## It works like this:
    ## Each xml form in the list of forms from the index action has a <downloadUrl/> tag
    ## The downloadUrl tag makes ODK Collect send a get request to this action.
    ## This action sends form's xml document to ODK Collect.
    ## See the ODK Collec docs here for more info: https://docs.getodk.org/openrosa-form-list/
    def show
      doc = Collect::Form.find(params[:id])
      send_data doc.document.download, filename: doc.document.filename.to_s, content_type: doc.document.content_type
    end

    def submission
      ## This submissions method is replaced by the 'submission' method in: 
      ## lib/generators/collect/templates/odk_controller.rb

      if request.method.eql?('POST')
        ## put your logic code here like the below example
        # hash = Crack::XML.parse(File.read(params[:xml_submission_file].path))
        # model = set_model(hash)
        model = 'nothing_device'
        if model != 'device_id'
        #   object = prepare_object(model, hash)
        #   form = "Demo::#{model.singularize.camelize}".constantize.new(object)
        #   respond_to do |format|
        #     if form.save
        #       format.xml { render status: 201 }
        #     else
        #       format.xml { render status: form.errors.messages }
        #     end
        #   end
        else
          render status: 201
        end
      else
        render status: 204
      end
    end

    private

      def set_header
        response.headers['X-OpenRosa-Version'] = '1'
        response.headers['Content-Type'] = 'text/xml; charset=utf-8'
      end

  end
end
