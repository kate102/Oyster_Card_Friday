require 'journey'

class Oystercard
  attr_reader :balance, :journey_history
  DEFAULT_LIMIT = 90
  MIN_BALANCE = 1

  def initialize
    @balance = 0
    @journey_history = []
    @current_journey
  end

  def top_up(amount)
    check_if_max_balance_exceeded(amount)
    @balance += amount
  end

  def check_if_max_balance_exceeded(amount)
    max_exceeded_error = "top-up unsuccessful, maximum balance of £#{DEFAULT_LIMIT} exceeded"
    raise max_exceeded_error if (@balance + amount) > DEFAULT_LIMIT
  end

  def in_journey?
    @journey_history.last.entry_station != nil &&
    @journey_history.last.exit_station == nil
  end

  def touch_in(station)
    check_has_min_balance
    @current_journey = Journey.new
    @current_journey.touch_in(station)
    @journey_history << @current_journey
  end

  def check_has_min_balance
    raise 'Insufficient balance to touch in.' if @balance < MIN_BALANCE
  end

  def touch_out(exit_station)
    if !@journey_history.empty? && @journey_history.last.exit_station == nil
      @journey_history.last.touch_out(exit_station)
    else
      @current_journey = Journey.new
      @current_journey.touch_out(exit_station)
      @journey_history << @current_journey
    end
    deduct(MIN_BALANCE)
  end

  def deduct(amount)
    @balance -= amount
  end

  private :deduct, :check_has_min_balance, :check_if_max_balance_exceeded
end
