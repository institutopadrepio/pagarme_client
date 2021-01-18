# frozen_string_literal: true

require 'active_interaction'
require 'pagarme'
PagarMe.api_key = ENV['PAGARME_API_KEY']

require 'pagarme_client/pagarme_base'
require 'pagarme_client/services/customers/create'


module PagarmeClient
  module_function
end