module Collect
  class Form < ApplicationRecord

    validates :name, presence: true, uniqueness: true
    validates :description, presence: true

    has_one_attached :document

  end
end
