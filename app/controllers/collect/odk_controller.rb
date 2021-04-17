module Collect
  class OdkController < ApplicationController
    ## Resource for use ActiveSupport Concerns in order to make overwritable methods for ODK
    ## Source
    ## http://stackoverflow.com/questions/7719633/how-to-extend-rails-engines-controllers-properly
    ## http://edgeguides.rubyonrails.org/engines.html#overriding-models-and-controllers
    ##
    ##
    ## Github Gist: https://gist.github.com/trejo08/11df06b3c6ff8fa26c610447005b721f
    include Collect::BaseOdkControllerActions

  end
end
