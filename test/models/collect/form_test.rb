require "test_helper"

module Collect
  class FormTest < ActiveSupport::TestCase

    ## to do: write test for correct_document_mime_type validation

    # def setup
    #   @form = collect_forms(:one)
    # end

    # test 'valid form' do
    #   assert @form.valid?
    # end

    context 'validations' do
      should validate_presence_of(:name)
      should validate_presence_of(:description)
    end

    context 'associations' do
      should have_one_attached(:document)
    end

  end
end
