# frozen_string_literal: true
module PagarmeClient
  module Services 
    module Operations
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
          result = PagarmeClient::Services::Decorators::Create.call({
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