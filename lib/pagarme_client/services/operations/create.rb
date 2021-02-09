# frozen_string_literal: true
require 'json'
module PagarmeClient
  module Services 
    module Operations
      class Create < PagarmeClient::PagarmeBase
        string :resource_id, :name, :cpf
        boolean :is_donation
        integer :amount

        def execute
          raise 'Invalid Pagar.me transaction' unless pagarme_transaction.success?
          JSON.parse(pagarme_transaction.body)
        end


        private 

        def pagarme_transaction
          @pagarme_transaction ||= Faraday.post(
            "#{BASE_URL}/transactions", 
            transaction_params.to_json, 
            "Content-Type" => "application/json"
          )
        end

        def transaction_params 
          result = PagarmeClient::Services::Formatters::Create.call({
            name: name,
            resource_id: resource_id,
            cpf: cpf,
            is_donation: is_donation,
            amount: amount
          })
          raise "#{result.error}" unless result.success?
          result.value
        end
      end
    end
  end
end