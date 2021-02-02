Gem::Specification.new do |s| 
  ### REQUIRED ###
  s.name        = 'pagarme_client'
  s.version     = '1.0.0'
  s.summary     = "Wrapper for Pagarme"
  s.authors     = ["Paulo Moncores"]
  s.files = ['lib/pagarme_client.rb', 
             'lib/pagarme_client/services/customers/create.rb',
             'lib/pagarme_client/services/operations/create.rb',
             'lib/pagarme_client/pagarme_base.rb'
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
  s.add_development_dependency 'pry', '~> 0.13.1'
  s.add_development_dependency 'active_interaction', '~> 4.0'
  s.add_development_dependency 'httparty', '~> 0.13.7'
  s.add_development_dependency "vcr",     "~> 5.1"
  s.add_development_dependency "webmock", "~> 3.8"
  s.add_development_dependency "pagarme", "~> 2.3.0"
end