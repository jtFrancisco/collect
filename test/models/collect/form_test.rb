require "test_helper"

module Collect
  class FormTest < ActiveSupport::TestCase

    def setup
      @form = collect_forms(:one)
    end

    test 'valid form' do
      @form.valid?
    end

    # test 'invalid without document' do
    #   refute @form.valid?, 'form is valid without a document'
    #   assert_not_nil @form.errors[:document], 'no validation error for document present'
    # end

    context 'validations' do
      should validate_presence_of(:name)
      should validate_presence_of(:description)
      should have_one_attached(:document)
    end

  end
end
