require 'oystercard'

describe Oystercard do

  subject(:oystercard) { described_class.new }

  describe '#balance' do
    it 'reads current balance' do
      expect(oystercard.balance).to eq(0)
    end
  end

  describe '#top_up' do
    it 'adds credit to the card' do
      expect{ oystercard.top_up 30 }.to change { oystercard.balance }.by 30
    end
  end

end
