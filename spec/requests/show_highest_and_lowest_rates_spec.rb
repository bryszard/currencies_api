require 'rails_helper'

describe 'Fetching highest and lowest exchange rates', type: :request do
  subject { get '/v1/rates' }

  it_behaves_like 'exchange rates endpoints'

  it 'returns highest and lowest rates from the list', :vcr do
    subject

    expect(response.status).to eq(200)
    expect(response.body).to eq({ 'GBP' => 0.85905, 'IDR' => 16_068.78 }.to_json)
  end
end
