require 'rails_helper'

describe 'Fetching list of currencies in descending alphabetical order', type: :request do
  subject { get '/v1/currencies' }

  it 'returns a list of available currencies in a String, comma separated' do
    expect(response.status).to eq(:ok)
    expect(response.body).to eq(
      'ZAR,USD,TRY,THB,SGD,SEK,RUB,RON,PLN,PHP,NZD,NOK,MYR,MXN,KRW,JPY,'\
      'ISK,INR,ILS,IDR,HUF,HRK,HKD,GBP,DKK,CZK,CNY,CHF,CAD,BRL,BGN,AUD'
    )
  end
end
