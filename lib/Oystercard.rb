class Oystercard

  MAX_BALANCE = 100
  MIN_BALANCE = 1

  attr_reader :balance, :entry_station, :exit_station, :journey, :journeys

  def initialize
    @balance = 0
    @in_journey = false
    @journeys = []
  end

  def top_up(credit)
    raise "max balance of #{MAX_BALANCE} exceeded" if beyond_max?(credit)
    @balance += credit
  end

  def touch_in(entry_station)
    raise "min balance of 1 not reached" if bellow_min?
    start_journey(entry_station)
  end

  def touch_out(exit_station)
    deduct(MIN_BALANCE)
    finish_journey(exit_station)
    register_journey
  end

  def in_journey?
    @in_journey
  end

  private

  def deduct(credit)
    @balance -= credit
  end

  def beyond_max?(credit)
    @balance + credit > MAX_BALANCE
  end

  def bellow_min?
    @balance < MIN_BALANCE
  end

  def register_journey
    @journey = {entry_station: @entry_station, exit_station: @exit_station}
    @journeys << @journey
    @in_journey = false
  end

  def start_journey(entry_station)
    @entry_station = entry_station
    @in_journey = true
  end

  def finish_journey(exit_station)
    @exit_station = exit_station
  end

end
