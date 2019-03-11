# frozen_string_literal: true

class V1::CurrenciesController < ApplicationController
  TEMPORARILY_UNAVAILABLE_MESSAGE = 'Exchange rates are temporarily not available.'
  CURRENCY_NOT_FOUND = 'Given currency code has not been found.'

  before_action :check_availability

  def list
    available_currencies = exchange_rates['rates'].keys.sort.reverse.join(',')

    render plain: available_currencies, status: :ok
  end

  def show
    if(exchange_rate = exchange_rates.dig('rates', params.require('currency_code')))
      render plain: exchange_rate.to_s, status: :ok
    else
      render plain: CURRENCY_NOT_FOUND, status: :not_found
    end
  end

  private

  def check_availability
    return true unless exchange_rates.blank?

    render plain: TEMPORARILY_UNAVAILABLE_MESSAGE, status: :service_unavailable
  end

  def exchange_rates
    @_exchange_rates ||= Actions::FetchCurrencyData.perform
  end
end
