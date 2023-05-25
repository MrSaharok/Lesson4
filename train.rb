require_relative 'station'
require_relative 'route'

class Train
  attr_reader :number, :type, :wagons, :route, :speed, :current_station_index

  def initialize(number, type)
    @number = number
    @type = type
    @wagons = []
    @speed = 0
    @current_station_index = 0
  end

  def to_s
    @number
  end

  def speed_up(speed)
    @speed += speed if speed <= 0
  end

  def stop
    @speed = 0
  end

  def relevant_wagon?(wagon)
    wagon.type == @type
  end

  def add_wagon(wagon)
    @wagons << wagon
  end

  def remove_wagons(wagon)
    if @speed.nonzero?
      @wagons.delete(wagon)
    end
  end

  def assign_route(route)
    @route = route
    @current_station_index = 0
    @route.stations[@current_station_index].add_train(self)
  end

  def current_station
    @route.stations[@current_station_index]
  end

  def next_station
    @route.stations[@current_station_index + 1]
  end

  def previous_station
    @route.stations[@current_station_index - 1]
  end

  def move_forward
    current_station.send_train(self)
    @current_station_index += 1
    current_station.add_train(self)
    puts "Train:#{self} is current station#{current_station}"
  end

  def move_backward
    current_station.send_train(self)
    @current_station_index -= 1
    current_station.add_train(self)
    puts "Train:#{self} is current station#{current_station}"
  end
end
