module Collect
  class FormsController < ApplicationController

    # This CRUD controller lets you manage the forms
    # that you can download in the ODK Collect mobile app.

    # Each form has a name, description, and an xml document attached with active storage
    # The xml document must be type xml, because ODK Collect only works with xml forms.
    # You must create an XLS form using an Excel spreadsheet according to this documentation:
    # https://xlsform.org/en/
    # Then convert the XLS form into an xml document with this converter:
    # https://getodk.org/xlsform/
    # Once you have a form prepared in the xml format, then upload it here:
    # http://localhost:3000/collect/forms/new

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
