Gem::Specification.new do |s| 
  ### REQUIRED ###
  s.name        = 'pagarme_client'
  s.version     = '1.1.2'
  s.summary     = "Wrapper for Pagarme"
  s.authors     = ["Paulo Moncores"]
  s.files = ['lib/pagarme_client.rb', 
             'lib/pagarme_client/services/customers/create.rb',
             'lib/pagarme_client/services/operations/create.rb',
             'lib/pagarme_client/services/operations/decorators/create.rb',
             'lib/pagarme_client/pagarme_base.rb',
             'lib/pagarme_client/application_decorator.rb'
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
  #s.add_development_dependency 'pry', '~> 0.13.1'
  s.add_runtime_dependency 'active_interaction', '~> 4.0'
  s.add_development_dependency "vcr",     "~> 5.1"
  s.add_development_dependency "webmock", "~> 3.8"
  s.add_runtime_dependency "pagarme", "~> 2.3.0"
end

# Result = PagarmeClient::Services::Operations::Create.run!(
#     resource_id: "1231231212312311231232",
#     name: "Payulo Vitor",
#        cpf: "06512424956",
#        is_donation: false,
#        amount: 10000
#      )