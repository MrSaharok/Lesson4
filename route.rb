class Route #Маршрут
  attr_reader  :route, :stations

  def initialize(station_first, station_last)
    @route = [station_first, station_last]
  end

  def add_station(station) #Добавление станции
      @route.insert(-2, station)
    end
  end

  def remove_station(station) # Удаление станции
    if stations != @route.first || station != route.last
      stations.delete(station)
    end
  end
