module Collect
  module BaseOdkControllerActions
    extend ActiveSupport::Concern

    def self.included(base)
      base.before_action :set_header, only: %i[index submissions]
      base.respond_to :xml
    end

    def index
      @forms = Collect::Form.all
      respond_to do |format|
        format.xml { render 'index.xml' }
      end
    end

    def show
      doc = Collect::Form.find(params[:id])
      send_data doc.document.download, filename: doc.document.filename.to_s, content_type: doc.document.content_type
    end

    def submissions
      if request.method.eql?('POST')
        # put your logic code here like the below example
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
