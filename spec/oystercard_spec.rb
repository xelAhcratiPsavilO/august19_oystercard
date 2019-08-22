require 'oystercard'

describe Oystercard do

  min_balance = Oystercard::MIN_BALANCE
  max_balance = Oystercard::MAX_BALANCE

  let(:entry_station){ double :station }
  let(:exit_station){ double :station }
  let(:journey){ {entry_station: entry_station, exit_station: exit_station} }

  subject(:oystercard) { described_class.new }

  describe '#balance' do
    it 'reads current balance' do
      expect(oystercard.balance).to eq 0
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
        oystercard.top_up(max_balance)
        expect { oystercard.top_up 1 }.to raise_error "max balance of #{max_balance} exceeded"
      end
    end
  end

  describe '#touch_in' do
    context 'when I have sufficient funds' do
      it 'registers the entry station' do
        oystercard.top_up min_balance
        oystercard.touch_in(entry_station)
        expect(oystercard.entry_station).to eq entry_station
      end
    end

    context 'when I do not have sufficient funds' do
      it 'raises an error' do
        expect { oystercard.touch_in(entry_station)}.to raise_error "min balance of #{min_balance} not reached"
      end
    end
  end

  describe '#touch_out' do
    it 'deducts fare' do
      oystercard.top_up min_balance
      oystercard.touch_in(entry_station)
      expect { oystercard.touch_out(exit_station) }.to change { oystercard.balance }.by -min_balance
    end
    it 'registers the exit station' do
      oystercard.top_up min_balance
      oystercard.touch_in(entry_station)
      oystercard.touch_out(exit_station)
      expect(oystercard.exit_station).to eq exit_station
    end
  end

  describe '#journeys' do
    it 'is empty by default' do
      expect(oystercard.journeys).to be_empty
    end
    it 'stores journeys' do
      oystercard.top_up min_balance
      oystercard.touch_in(entry_station)
      oystercard.touch_out(exit_station)
      expect(oystercard.journeys).to include journey
    end
  end

end
