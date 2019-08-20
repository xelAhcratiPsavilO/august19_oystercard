class Oystercard

  MAX_BALANCE = 100

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

end
