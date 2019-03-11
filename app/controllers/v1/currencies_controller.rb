# frozen_string_literal: true

class V1::CurrenciesController < ApplicationController
  TEMPORARILY_UNAVAILABLE_MESSAGE = 'Exchange rates are temporarily not available.'

  before_action :check_availability

  def list
    available_currencies = exchange_rates['rates'].keys.sort.reverse.join(',')

    render plain: available_currencies, status: :ok
  end

    else
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
