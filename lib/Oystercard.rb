class Oystercard

  MAX_BALANCE = 100
  MIN_BALANCE = 1

  attr_reader :balance

  def initialize
    @balance = 0
    @journey = false
  end

  def top_up(credit)
    raise "max balance of #{MAX_BALANCE} exceeded" if beyond_max?(credit)
    @balance += credit
  end

  def deduct(credit)
    @balance -= credit
  end

  def touch_in
    raise "min balance of 1 not reached" if bellow_min?
    @journey = true
  end

  def touch_out
    @journey = false
  end

  def in_journey?
    @journey
  end

  private

  def beyond_max?(credit)
    @balance + credit > MAX_BALANCE
  end

  def bellow_min?
    @balance < MIN_BALANCE
  end

end
