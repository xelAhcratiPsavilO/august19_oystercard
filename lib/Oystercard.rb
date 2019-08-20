class Oystercard

  MAX_BALANCE = 100

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(credit)
    raise "sorry max balance is #{MAX_BALANCE}" if @balance + credit > MAX_BALANCE
    @balance += credit
  end

end
