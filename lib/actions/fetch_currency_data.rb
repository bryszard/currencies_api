# frozen_string_literal: true

require 'net/http'

module Actions
  class FetchCurrencyData
    SOURCE = 'https://api.exchangeratesapi.io/latest'

    def self.perform
      Rails.cache.fetch("currencies_to_euro_#{Date.today.to_formatted_s}", expires_in: 24.hours) do
        uri = URI(SOURCE)
        response = Net::HTTP.get(uri)

        JSON.parse(response)
      end
    end
  end
end
