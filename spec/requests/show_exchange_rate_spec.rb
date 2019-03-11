require 'rails_helper'

describe 'Fetching exchange rate for a given currency', type: :request do
  subject { get '/v1/currencies/show', params: params }

  let(:params) { { currency_code: currency_code } }
  let(:currency_code) { 'PLN' }

  it_behaves_like 'exchange rates endpoints'

  it 'returns rate for a given currency', :vcr do
    subject

    expect(response.status).to eq(200)
    expect(response.body).to eq('4.3002')
  end

  context 'when currency does not exist on the list' do
    let(:currency_code) { 'XXX' }

    it 'returns a message that ', :vcr do
      subject

      expect(response.status).to eq(404)
      expect(response.body).to eq('Given currency code has not been found.')
    end
  end
end
