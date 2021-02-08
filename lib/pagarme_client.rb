# frozen_string_literal: true

require 'active_interaction'
require 'pagarme'
PagarMe.api_key =  'ak_test_NuKtZwDfZ8QCFmubBge1wdBFnAJ87Y' #ENV['PAGARME_API_KEY']

require 'pagarme_client/pagarme_base'
require 'pagarme_client/application_decorator'
require 'pagarme_client/services/customers/create'
require 'pagarme_client/services/operations/decorators/create.rb'
require 'pagarme_client/services/operations/create'


module PagarmeClient
  module_function
end