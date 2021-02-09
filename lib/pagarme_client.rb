# frozen_string_literal: true

require 'active_interaction'
require 'pagarme_client/pagarme_base'
require 'pagarme_client/configuration'
require 'pagarme_client/application_formatter'
require 'pagarme_client/services/operations/formatters/create'
require 'pagarme_client/services/operations/create'


module PagarmeClient
  module_function

  class PagarmeClientConfiguration
  
    def self.configuration
      @configuration ||= Configuration.new
    end

    def self.configure(&block)
      yield(configuration)
    end 
  end
end

