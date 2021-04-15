require "test_helper"

module Collect
  class FormTest < ActiveSupport::TestCase

    context 'validations' do
      should validate_presence_of(:name)
      should validate_presence_of(:description)
      should have_one_attached(:document)
    end

  end
end
