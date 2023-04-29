Gem::Specification.new do |s| 
  ### REQUIRED ###
  s.name        = 'pagarme_client'
  s.version     = '1.2.5'
  s.summary     = "Wrapper for Pagarme"
  s.authors     = ["Instituto Padre Pio"]
  s.files = ['lib/pagarme_client.rb', 
             'lib/pagarme_client/services/operations/create.rb',
             'lib/pagarme_client/services/operations/formatters/create.rb',
             'lib/pagarme_client/pagarme_base.rb',
             'lib/pagarme_client/application_formatter.rb'
            ]
  ### WARNING ###
  s.homepage    = 'https://www.padrepauloricardo.com'
  s.license     = 'MIT' 
  ### RECOMMENDED ###
  s.description = 'Client for Pagarme payment gateway' # nice to have 
  s.email       = 'paulomoncores@gmail.com' # nice to have
  ### Dependencies ###
  s.add_development_dependency "bundler", "~> 2.0"
  s.add_development_dependency "rake",    "~> 12.3.3"
  s.add_development_dependency "rspec",   "~> 3.7"
  s.add_runtime_dependency 'active_interaction', '~> 4.0'
  s.add_runtime_dependency 'faraday', '>= 1.10.0'
  s.add_development_dependency "vcr",     ">= 5.1"
  s.add_development_dependency "webmock", ">= 3.8"
end
