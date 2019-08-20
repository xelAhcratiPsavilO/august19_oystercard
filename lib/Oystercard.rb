class Oystercard

  MAX_BALANCE = 100
  
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(credit)
    raise "max balance of #{MAX_BALANCE} exceeded" if beyond_max?(credit)
    @balance += credit
  end

  private

  def beyond_max?(credit)
    @balance + credit > MAX_BALANCE
  end

end
