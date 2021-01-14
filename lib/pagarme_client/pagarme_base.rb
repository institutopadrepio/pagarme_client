module PagarmeClient
  class PagarmeBase < ActiveInteraction::Base
    API_VERSION = '1'
    BASE_URL = "https://api.pagar.me/#{API_VERSION}"

    private

    def build_basic_auth_params(hash)
      hash[:basic_auth] = {
        username: ENV['PAGARME_API_KEY'],
        password: ENV['PAGARME_API_PASSWORD']
      }
    end

    def build_header_params(hash)
      hash[:headers] = {
        'Content-Type' => 'application/json',
        'Accept' => 'application/json'
      }
    end

    def base_params 
      {}.tap do |hash|
        build_basic_auth_params(hash)
        build_header_params(hash)
      end
    end
  end
end