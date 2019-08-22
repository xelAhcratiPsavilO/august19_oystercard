require 'station'

describe Station do


  subject(:station) { described_class.new(:name, :zone) }

  describe '#name' do
    it 'responds with the initialized name' do
      expect(station.name).to eq :name
    end
  end

  describe '#zone' do
    it 'responds with the initialized zone' do
      expect(station.zone).to eq :zone
    end
  end

end
