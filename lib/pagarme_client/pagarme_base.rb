module PagarmeClient
  class PagarmeBase < ActiveInteraction::Base
    API_VERSION = '1'
    BASE_URL = "https://api.pagar.me/#{API_VERSION}"
  end
end