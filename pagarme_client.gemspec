Gem::Specification.new do |s| 
  ### REQUIRED ###
  s.name        = 'pagarme_client'
  s.version     = '1.0.0'
  s.summary     = "Wrapper for Pagarme"
  s.authors     = ["Paulo Moncores"]
  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  # s.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
  #   `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  # end
  # s.bindir        = "exe"
  # s.executables   = s.files.grep(%r{^exe/}) { |f| File.basename(f) }
  # s.require_paths = ["lib"]
  s.files = [ 'lib/pagarme_client.rb', 'lib/pagarme_client/services/customers/create.rb']


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
end