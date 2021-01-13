# frozen_string_literal: true

module PagarmeClient
  module Services 
    module Customers
      class Create < ActiveInteraction::Base
        float :x

        def execute
          x**2
        end
      end
    end
  end
end