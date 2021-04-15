require_dependency "collect/application_controller"

module Collect
  class FormsController < ApplicationController
    
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
        flash[:success] = "Form was saved."
        redirect_to form_path(@form)
      else
        flash[:error] = "Form could not be saved."
        render 'new'
      end
    end

    def edit
      @form = Form.find(params[:id])
    end

    def update
      @form = Form.find(params[:id])
      if @form.update(form_params)
        flash[:success] = "Form was updated."
        redirect_to form_path(@form)
      else
        flash[:error] = "Form could not be updated."
        render 'edit'
      end
    end

    def destroy
      @form = Form.find(params[:id])
      @form.destroy
      if @form.destroy      
        flash[:success] = "Form was destroyed."
        redirect_to forms_path
      else
        flash[:success] = "Form could not be destroyed."
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
