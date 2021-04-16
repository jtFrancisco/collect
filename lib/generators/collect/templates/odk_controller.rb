require 'crack'
module Collect
  class OdkController < ApplicationController
    include Collect::BaseOdkControllerActions
    protect_from_forgery unless: -> { request.format.xml? }
    # before_action :check_auth

    def submissions
      puts "controller odk application"
      if request.method == ('POST')
        raw_file = Crack::XML.parse(File.read(params[:xml_submission_file].path)).with_indifferent_access

        model = get_model(raw_file)
        object = get_values(raw_file)
        record = prepare_object(model, object)

        response = record.save ? 201 : record.errors.messages
        respond_to do |format|
          format.xml { render status: response }
        end
      else
        render status: 204
      end
    end


    def set_example(record)
      puts "=======================XML Object======================="
      puts "### XML Object: #{record}"
      puts "=======================XML Object======================="

      country_team = User.where(email: record[:username]).first.country_team
      country_team_id = country_team.id
      # puts "country_team_id === #{country_team_id}"
      exchange_rate = country_team.country.exchange_rate
      # puts "exchange_rate === #{exchange_rate}"

      e = Example.new()
        e.country_team_id = country_team_id
        e.exchange_rate = exchange_rate
        
        e.age = record[:age]

        if record[:coordinates] == nil
          e.coordinates = {"lat"=>"0.0", "lng"=>"0.0"}
        else  
          e.coordinates = set_coordinates(record)
        end

        e.metadata = set_metadata(record)
      e
    end


    private
      def check_auth
        ## resources for ODK API using devise authentication digest and ODK Basic HTTP Authentication
        ## Devise: https://github.com/plataformatec/devise/wiki/How-To:-Use-HTTP-Basic-Authentication
        ## ODK: https://docs.opendatakit.org/openrosa-authentication/#authentication-api
        authenticate_or_request_with_http_basic do |username, password|
          resource = User.find_by_email(username)
          if resource.present?
            if resource.valid_password?(password) # && resource.status.eql?(true) # uncomment if you want to check other attribute like 'status'
              sign_in :user, resource
            else
              false
            end
          else
            false
          end
        end
      end

      # def load_file(parameter_name)
      #   path = params["#{parameter_name}"].path
      #   File.exists?(path) ? File.open(path) : nil
      # end

      def get_model(obj)
        obj.keys.first
      end

      def get_values(obj)
        obj.values.first
      end

      def prepare_object(model, record)
        puts "==============> #{model}"
        case model
        # This 'example' must be the name of the xml file, the name, and the 
        # description from http://localhost:3000/collect/forms
        # example should be the name of the model in the example, too.
        when 'example'
          set_example(record)
        else
          nil
        end unless model.nil? && record.nil?
      end

      # set_metadata helps with saving metadata from ODK submissions
      def set_metadata(record)
        {
          start: record[:start],
          end: record[:end],
          today: record[:today],
          deviceid: record[:deviceid],
          subscriberid: record[:subscriberid],
          simserial: record[:simserial],
          username: record[:username],
          phonenumber: record[:phonenumber]
        }
      end

      # set_coordinates helps with gps data coming from ODK submissions
      def set_coordinates(record)
        {
          lat: record[:coordinates].split(' ').first,
          lng: record[:coordinates].split(' ').second,
          elev: record[:coordinates].split(' ').third
        }
      end      

  end
end
