module Collect
  module BaseFormsControllerActions
    extend ActiveSupport::Concern

    ## This controller lets you manage forms.
    ## Forms can be download in the ODK Collect mobile app.
    #
    ## A Form has:
    ## name
    ## description
    ## document (attached with active storage).
    #
    ## The document must be type xml because:
    ## ODK Collect uses the xml document to display the Form in the ODK Collect mobile app.
    #
    ## Step 1: Create an XLS form using an Excel spreadsheet according to this documentation:
    ## Use the example in:
    ## /test/fixtures/files/tree_survey.xlsx
    ## See xlsform docs:
    ## https://xlsform.org/en/
    #
    ## Step: 2. Convert the XLS form into an xml document with this converter:
    ## https://getodk.org/xlsform/
    ## If you use the tree_survey.xlsx file from step 2 your output is a file like this:
    ## /test/fixtures/files/tree_survey.xml
    #
    ## Step 3: Go to:
    ## http://localhost:3000/collect/forms/
    #
    ## Step 4: Click "New Form"
    ## http://localhost:3000/collect/forms/new
    #
    ## Step 5: Save the name, description, and upload the form xml document:
    ## The file from: /test/fixtures/files/tree_survey.xml

    def index
      @forms = Form.order(created_at: :desc)        
    end

    def show
      @form = Form.find(params[:id])
    end

    def new
      @form = Form.new
    end

    def create
      @form = Form.new(form_params)
      if @form.save
        flash[:notice] = "Form was saved."
        redirect_to form_path(@form)
      else
        flash[:notice] = "Form could not be saved."
        render 'new'
      end
    end

    def edit
      @form = Form.find(params[:id])
    end

    def update
      @form = Form.find(params[:id])
      if @form.update(form_params)
        flash[:notice] = "Form was updated."
        redirect_to form_path(@form)
      else
        flash[:notice] = "Form could not be updated."
        render 'edit'
      end
    end

    def destroy
      @form = Form.find(params[:id])
      @form.destroy
      if @form.destroy      
        flash[:notice] = "Form was destroyed."
        redirect_to forms_path
      else
        flash[:notice] = "Form could not be destroyed."
        redirect_to form_path(@form)
      end
    end

    private

      def form_params
        params.require(:form).permit(
          :name,
          :description,
          :document
        )
      end

  end
end