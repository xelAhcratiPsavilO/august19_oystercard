require 'oystercard'

describe Oystercard do

  subject(:oystercard) { described_class.new }

  describe '#balance' do
    it 'reads current balance' do
      expect(oystercard.balance).to eq(0)
    end
  end

  describe '#top_up' do
    context 'while the max balance is not reached' do
      it 'adds credit to the card' do
        expect { oystercard.top_up 30 }.to change { oystercard.balance }.by 30
      end
    end

    context 'when the max balance is reached' do
      it 'raises an error' do
        max_balance = Oystercard::MAX_BALANCE
        oystercard.top_up(max_balance)
        expect { oystercard.top_up 1 }.to raise_error "max balance of #{max_balance} exceeded"
      end
    end
  end

  describe '#deduct' do
    it 'substracts credit from the card' do
      expect { oystercard.deduct 30 }.to change { oystercard.balance }.by -30
    end
  end

  describe '#in_journey?' do
    it 'is deactivated by default' do
      expect(oystercard).to_not be_in_journey
    end
  end

  describe '#touch_in' do
    it 'activates in journey' do
      oystercard.touch_in
      expect(oystercard).to be_in_journey
    end
  end

  describe '#touch_out' do
    it 'deactivates in journey' do
      oystercard.touch_in
      oystercard.touch_out
      expect(oystercard).to_not be_in_journey
    end
  end

end
