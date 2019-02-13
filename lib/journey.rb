class Journey
  attr_reader :entry_station, :exit_station, :fare

  def initialize
    @entry_station = nil
    @exit_station = nil
    @fare = 1
  end

  def touch_in(station)
    @entry_station = station
  end


  def touch_out(station)
    @exit_station = station
  end


  def journey_complete?
    !@entry_station.nil? && !@exit_station.nil?
  end


  def assign_penalty_fare
    @fare = 6
  end

  def fare
    @fare
  end

end
