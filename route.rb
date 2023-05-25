class Route
  attr_reader :route, :stations

  def initialize(station_first, station_last)
    @route = [station_first, station_last]
  end

  def add_station(station)
    @route.insert(-2, station)
  end

  def remove_station(station)
    if stations != @route.first || station != route.last
      stations.delete(station)
    end
  end
end
