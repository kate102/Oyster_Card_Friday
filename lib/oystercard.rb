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
    touch_in_checks
    add_journey_to_history
    @current_journey.touch_in(station)
  end

  def check_has_min_balance
    raise 'Insufficient balance to touch in.' if @balance < MIN_BALANCE
  end

  def touch_out(exit_station)
    (!@journey_history.empty? && @journey_history.last.exit_station == nil) ? successful_touch_out(exit_station) : unsuccessful_touch_out(exit_station)
    deduct(MIN_BALANCE)
  end

  def check_last_journey
    @journey_history.last.assign_penalty_fare if !@journey_history.empty? && !@journey_history.last.journey_complete?
  end

  def touch_in_checks
    check_last_journey
    check_has_min_balance
  end

  def add_journey_to_history
    @current_journey = Journey.new
    @journey_history << @current_journey
  end

  def deduct(amount)
    @balance -= amount
  end

  def successful_touch_out(exit_station)
    @journey_history.last.touch_out(exit_station)
  end

  def unsuccessful_touch_out(exit_station)
    add_journey_to_history
    check_last_journey
    @current_journey.touch_out(exit_station)
  end

  private :deduct, :check_has_min_balance, :check_if_max_balance_exceeded
end
