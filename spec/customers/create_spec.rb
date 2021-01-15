require 'spec_helper'
#require 'pagarme_client/services/customers/create'

RSpec.describe PagarmeClient::Services::Customers::Create do
  describe '#execute', vcr: true do 
    
    before(:each) do 
      ENV['PAGARME_API_KEY'] = 'ak_test_NuKtZwDfZ8QCFmubBge1wdBFnAJ87Y'
      ENV['PAGARME_API_PASSWORD'] = 'x'
    end

    it 'creates customer on pagar.me' do 
      
      result = PagarmeClient::Services::Customers::Create.run(
        name: 'Paulo Moncores',
        email: 'paulomoncores@test.com',
        phone: '+5511999999999',
        cpf: '46176314887',
        id: '10'
      )
      binding.pry
    end
  end
end