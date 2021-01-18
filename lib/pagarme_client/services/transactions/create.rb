# frozen_string_literal: true

module PagarmeClient
  module Services 
    module Transactions
      class Create < PagarmeClient::PagarmeBase
        string :resource_id, :name, :cpf
        boolean :is_donation
        integer :amount

        def execute
          request = HTTParty.post(
            "#{BASE_URL}/transactions", 
            transaction_params
          )
          binding.pry
          raise request.message unless request.success?
          JSON.parse(request.body)
        end

        private 

        def transaction_params 
          base_params.merge!(
            {
              body: build_transaction_params
            }
          )
        end

        def build_transaction_params 
          {}.tap do |hash|
            build_transaction_basic_info_params(hash)
            build_transaction_user_info_params(hash)
          end
        end

        def build_transaction_user_info_params(hash)
          hash[:customer] = {
            type: 'individual',
            country: 'br',
            name: name, 
            documents: [
              {
                type: 'cpf',
                number: cpf
              }
            ]
          }
        end

        def build_transaction_basic_info_params(hash)
          hash[:api_key] = ENV['PAGARME_API_KEY']
          hash[:async] = 'false'
          hash[:amount] = amount
          hash[:payment_method] = 'boleto'
          hash[:metadata] = { 'id_transacao': resource_id }
          hash[:postback_url] = build_postback_url
        end

        def donation? 
          is_donation
        end

        def build_postback_url
          entity = donation? ? 'payment_notifications' : 'donation_notifications'
          "https://#{BASE_URL}/#{entity}/#{resource_id}" 
        end

      end
    end
  end
end