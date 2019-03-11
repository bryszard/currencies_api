require 'rails_helper'

describe Actions::FetchCurrencyData do
  describe '.perform' do
    subject { described_class.perform }

    before do
      Rails.cache.clear
    end

    it 'fetches recent exchange rates data (for EUR), saves it in a cache' do
      expect(subject['rates'].keys.count).to eq(32)

      expect(subject['base']).to eq('EUR')
      expect(Rails.cache.fetch("currencies_to_euro_#{Date.today.to_formatted_s}")).to eq(subject)
    end
  end
end
