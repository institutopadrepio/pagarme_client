# frozen_string_literal: true

module PagarmeClient
  module Services 
    module Customers
      class Create < PagarmeClient::PagarmeBase
        string :name, :email, :phone, :cpf, :id

        def execute
          request = HTTParty.post("#{BASE_URL}/customers", customer_params)
          raise request.message unless request.success?
          JSON.parse(request.body)
        end

        private 

        def customer_params 
          base_params.merge!(
            {
              body: build_customer_params
            }
          )
        end

        def build_customer_params 
          {}.tap do |hash|
            hash[:name] = name
            hahs[:email] = email 
            hash[:type] = 'individual'
            hash[:country] = 'br'
            hash[:external_id] = user_id 
            hash[:phone_numbers] = [phone]
            hash[:documents] = [{type: 'cpf', number: cpf }]
          end
        end
      end
    end
  end
end