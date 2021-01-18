require 'spec_helper'

RSpec.describe PagarmeClient::Services::Customers::Create do
  describe '#execute', vcr: true do 
    
    before(:each) do 
      ENV['PAGARME_API_KEY'] = 'ak_test_NuKtZwDfZ8QCFmubBge1wdBFnAJ87Y'
      PagarMe.api_key = ENV['PAGARME_API_KEY']
    end

    it 'creates customer on pagar.me' do 
      outcome = PagarmeClient::Services::Customers::Create.run(
        name: 'Paulo Moncores',
        email: 'paulomoncores@test.com',
        phone: '+5511999999999',
        cpf: '46176314887',
        external_id: '#123456789'
      )
      expect(outcome.result.is_a?(PagarMe::Customer)).to be_truthy
    end
  end
end