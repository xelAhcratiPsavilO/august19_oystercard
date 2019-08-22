require 'station'

describe Station do


  subject(:station) { described_class.new(:name, :zone) }

  describe '#name' do
    it 'has a name' do
      expect(station.name).to eq :name
    end
  end

  describe '#zone' do
    it 'has a zone' do
      expect(station.zone).to eq :zone
    end
  end

end
