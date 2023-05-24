class Station #Станция
  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
  end
  def to_s
    @name
  end
  def add_train(train) # Принимаем поезда
    trains << train
  end

  def trains_type(type) # Список поездов на станции по типу
    trains.select { |train| train.type == type}
  end

  def send_train(train) # Отправка поезда
    trains.delete(train)
  end
end
