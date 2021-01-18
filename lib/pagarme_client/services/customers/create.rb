# frozen_string_literal: true
require 'pry'

module PagarmeClient
  module Services 
    module Customers
      class Create < PagarmeClient::PagarmeBase
        string :name, :email, :phone, :cpf, :external_id

        def execute
          PagarMe::Customer.create(customer_params)
        end

        private 

        def customer_params 
          {}.tap do |hash|
            hash['external_id'] = external_id
            hash['name'] = name
            hash['type'] = 'individual'
            hash['country'] = 'br'
            hash['email'] = email 
            hash['documents'] = [
              {'type' => 'cpf', 'number' => cpf}
            ]
            hash['phone_numbers'] = [phone]
          end
        end
      end
    end
  end
end