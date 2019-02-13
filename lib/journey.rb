class Journey
  attr_reader :entry_station, :exit_station

  def initialize
    @entry_station = nil
    @exit_station = nil
  end

  def touch_in(station)
    @entry_station = station
  end

  def touch_out(station)
    @exit_station = station
  end

end
