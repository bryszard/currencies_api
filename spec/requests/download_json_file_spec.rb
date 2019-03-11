require 'rails_helper'

describe 'Fetching highest and lowest exchange rates', type: :request do
  subject { get '/v1/download' }

  it_behaves_like 'exchange rates endpoints'

  it 'returns a file with ', :vcr do
    subject

    expect(response.status).to eq(200)

    expect(response.headers['Content-Type']).to eq('application/json')
    expect(response.headers['Content-Disposition']).to eq("attachment; filename=\"b5d9aa36639d4b7562f8807d98066085.json\"")

    payload = JSON.parse(response.body)
    expect(payload.keys.count).to eq(32)
    expect(payload['PLN']).to be_a(Float)
  end
end
