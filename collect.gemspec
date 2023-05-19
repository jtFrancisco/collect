require_relative "lib/collect/version"

Gem::Specification.new do |spec|
  spec.name        = "collect"
  spec.version     = Collect::VERSION
  spec.authors     = ["donBigote"]
  spec.email       = ["jefferson@dataconsulta.com"]
  spec.homepage    = "https://github.com/donBigote/collect"
  spec.summary     = "An engine for connecting ODK Collect to a Rails app"
  spec.description = "An engine for connecting ODK Collect to a Rails app"
  spec.license     = "MIT"

  ## Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  ## to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/donBigote/collect"
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency 'rack-cors'
  # spec.add_dependency "rails", "~> 6.1.3", ">= 6.1.3.1"
  spec.add_dependency "rails", ">= 5.2.2"
  spec.add_dependency 'responders'
end
