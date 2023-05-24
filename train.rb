require_relative 'station'
require_relative 'route'

class Train #Поезд
  attr_accessor :number, :type, :wagons, :speed, :route, :current_station_index

  def initialize(number, type)
    @number = number
    @type = type
    @wagons = []
    @speed = 0
    @current_station_index = 0
  end

  def speed_up(speed)
    # Увеличение скорости
    @speed += speed if speed <= 0
  end

  def stop # Остановка
    @speed = 0
  end

  def relevant_wagon?(wagon)
    # Проверка на совместимость грузовых и пассажирских
    wagon.type == @type
  end

  def add_wagon(wagon)
    # Добавление вагонов
    @wagons << wagon
  end

  def remove_wagons(wagon)
    #Отсоединение вагонов
    if @speed.nonzero?
      @wagons.delete(wagon)
    end
  end

  def current_station # Текущая станция
    @route.stations[current_station_index]
  end

  def next_station # Следующая станция
    @route.stations[current_station_index + 1]
  end

  def previous_station # Предыдущая станция
    @route.stations[current_station_index - 1]
  end

  def assign_route(route)
    @route = route
    @current_station_index = 0
    @route.stations[@current_station_index].add_train
  end

  def move_forward # Движение вперед
    @current_station_index += 1
  end

  def move_backward # Движение назад
    current_station.send_train
    @current_station_index -= 1
    current_station.add_train
  end
end
