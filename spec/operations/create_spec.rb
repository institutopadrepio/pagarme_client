require 'spec_helper'
require 'pagarme_client/services/operations/create'
require 'pry'

RSpec.describe PagarmeClient::Services::Operations::Create do
  describe '#execute', vcr: true do 
    
    before(:each) do 
      ENV['PAGARME_API_KEY'] = 'ak_test_NuKtZwDfZ8QCFmubBge1wdBFnAJ87Y'
      PagarMe.api_key = ENV['PAGARME_API_KEY']
    end

    context 'success' do 
      it 'creates transactions on pagar.me' do 
        outcome = PagarmeClient::Services::Operations::Create.run(
          resource_id: "100",
          is_donation: false, 
          amount: 10000,
          name: 'Paulo Vitor dos Santos Zeferino',
          cpf: '08522325782'
        )
        expect(outcome.result[:boleto_url]).not_to be_nil
        expect(outcome.result[:boleto_barcode]).not_to be_nil
      end
    end

    context 'failure' do 
      it 'does not create pagar.me transaction' do 
        outcome = PagarmeClient::Services::Operations::Create.run(
          resource_id: "100",
          is_donation: false, 
          amount: nil,
          name: 'Paulo Vitor dos Santos Zeferino',
          cpf: '08522325782'
        )
        expect(outcome.result).to be_nil
      end
    end
  end
end