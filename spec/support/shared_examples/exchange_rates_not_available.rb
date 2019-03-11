shared_examples_for 'exchange rates endpoints' do
  context 'when exchange rates cannot be fetched' do
    before do
      allow(Actions::FetchCurrencyData).to receive(:perform)
    end

    it 'returns 503 http code (Not Available) with a message' do
      subject

      expect(response.status).to eq(503)
      expect(response.body).to eq('Exchange rates are temporarily not available.')
    end
  end
end
