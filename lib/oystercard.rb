class Oystercard

  attr_reader :balance, :in_journey
  MAX_BALANCE = 90
    # MIN_BALANCE = 1
    
  def initialize
    @balance = 0
    @in_journey = false 
  end
  
  def top_up(amount)
    fail "Balance has reached limit of 90" if amount + balance > MAX_BALANCE
    @balance += amount
  end
  
  def deduct(amount)
    @balance -= amount
  end
  
  def touch_in
    # fail 'Balance too low!' if balance < MIN_BALANCE
    @in_journey = true
  end
  
  def in_journey?
    @in_journey
  end
  
  def touch_out
    @in_journey = false
  end
    
end