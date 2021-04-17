require 'rails/generators/migration'
module Collect
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      def self.source_root
        File.expand_path('../templates', __FILE__)
      end

      def generate_install
        rake 'collect:install:migrations'
      end

      def setup_routes
        route "mount Collect::Engine => '/collect'"
      end

      def setup_rails_cors
        inject_into_file "config/application.rb", cors_code, after: "class Application < Rails::Application\n"
      end

      def cors_code
<<RUBY

    ##################################
    #### gem 'collect' code begins
    ## This config area works with rack-cors gem, and allows requests to the API
    ## by any client provided that the request was requested by the app
    #
    ## This may not be necessary in Rails 6.
    #
    ## Another issue with Rails 6 is whitelisting the config.hosts in development.rb and production.rb
    ## see this article: https://www.fngtps.com/2019/rails6-blocked-host/
    ## In development.rb you can use:
    ## config.hosts.clear
    #
    ## In production.rb you can:
    ## Whitelist one hostname
    ## config.hosts << "hostname"
    ## Whitelist a test domain
    ## config.hosts << /application\.local\Z/

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', headers: :any, methods: [:get, :post, :options]
      end
    end
    #### gem 'collect' code ends
    ##################################

RUBY
      end

      def copy_odk_controller
        copy_file 'odk_controller.rb', 'app/controllers/collect/odk_controller.rb'
        copy_file 'forms_controller.rb', 'app/controllers/collect/forms_controller.rb'
      end

    end
  end
end
