# frozen_string_literal: true
module PagarmeClient
  module Services 
    module Formatters
      class Create < ApplicationFormatter

        def initialize(params)
          @params = params 
        end

        def call
          Result.new(true, nil, build_transaction_params)
        rescue StandardError => e
          Result.new(false, e.message, nil)
        end

        private

        attr_accessor :params

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
            name: params[:name], 
            documents: [
              {
                type: 'cpf',
                number: params[:cpf]
              }
            ]
          }
        end

        def build_transaction_basic_info_params(hash)
          hash[:api_key] = 'ak_test_NuKtZwDfZ8QCFmubBge1wdBFnAJ87Y'
          hash[:async] = 'false'
          hash[:amount] = params[:amount]
          hash[:payment_method] = 'boleto'
          hash[:metadata] = { 'id_transacao': params[:resource_id] }
          hash[:postback_url] = build_postback_url
        end

        def donation? 
          params[:is_donation]
        end

        def build_postback_url
          entity = donation? ? 'payment_notifications' : 'donation_notifications'
          "#{PagarmeClient::PagarmeBase::BASE_URL}/#{entity}/#{params[:resource_id]}" 
        end
      end
    end
  end
end