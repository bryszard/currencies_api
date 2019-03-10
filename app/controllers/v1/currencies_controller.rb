class V1::CurrenciesController < ApplicationController
  def list
    exchange_rates = Actions::FetchCurrencyData.perform
    available_currencies = exchange_rates['rates'].keys.join(',')

    render plain: available_currencies
  end
end
