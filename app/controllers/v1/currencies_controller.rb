# frozen_string_literal: true

class V1::CurrenciesController < ApplicationController
  TEMPORARILY_UNAVAILABLE_MESSAGE = 'Exchange rates are temporarily not available.'

  def list
    if(current_rates = exchange_rates['rates'])
      available_currencies = current_rates.keys.sort.reverse.join(',')

      render plain: available_currencies, status: :ok
    else
      render plain: TEMPORARILY_UNAVAILABLE_MESSAGE, status: :unprocessable_entity
    end
  end

  def exchange_rates
    @_exchange_rates ||= Actions::FetchCurrencyData.perform
  end
end
