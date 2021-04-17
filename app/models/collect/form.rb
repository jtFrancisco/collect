module Collect
  class Form < ApplicationRecord

    ## TO DO: add a callback that saves the updated_at in an array to populate xml forms w/ versions with:
    ## listAllVersions 
    ## see: https://docs.getodk.org/openrosa-form-list/

    ## Each form has: name, description, and .xml document attached with Active Storage
    ## The document must be a .xml file, because ODK Collect only works with xml.
    ## You must create an XLS form using an Excel spreadsheet according to this documentation:
    ## https://xlsform.org/en/
    ## Then convert the XLS form into an xml document with this converter:
    ## https://getodk.org/xlsform/
    ## Once you have a form prepared in the xml format, then upload it here:
    ## http://localhost:3000/collect/forms/new

    validates :name, presence: true, uniqueness: true
    validates :description, presence: true

    has_one_attached :document, dependent: :destroy

    validate :correct_document_mime_type

    private

      def correct_document_mime_type
        if !document.attached? || !document.content_type.in?(%w(application/xml))
          errors.add(:document, 'invalid! The file must be an XML file.')
        end
      end

  end
end
