# frozen_string_literal: true
require 'pry'

module PagarmeClient
  module Services 
    module Transactions
      class Create < PagarmeClient::PagarmeBase
        string :resource_id, :name, :cpf
        boolean :is_donation
        integer :amount

        def execute
          transaction = PagarMe::Transaction.new(transaction_params)
          transaction.charge
          {
            boleto_url: transaction.boleto_url,
            boleto_barcode: transaction.boleto_barcode
          }
        end

        private 

        def transaction_params 
          build_transaction_params
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
          "#{PagarmeClient::PagarmeBase::BASE_URL}/#{entity}/#{resource_id}" 
        end

      end
    end
  end
end