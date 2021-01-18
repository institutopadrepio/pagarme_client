require 'spec_helper'
require 'pagarme_client/services/transactions/create'
require 'pry'

RSpec.describe PagarmeClient::Services::Transactions::Create do
  describe '#execute', vcr: true do 
    
    before(:each) do 
      ENV['PAGARME_API_KEY'] = 'ak_test_NuKtZwDfZ8QCFmubBge1wdBFnAJ87Y'
      ENV['PAGARME_API_PASSWORD'] = 'x'
    end

    it 'creates transactions on pagar.me' do 
      
      outcome = PagarmeClient::Services::Transactions::Create.run!(
        resource_id: "100",
        is_donation: false, 
        amount: 10000,
        name: 'Paulo Vitor dos Santos Zeferino',
        cpf: '06512424956'
      )
    end
  end
end