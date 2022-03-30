class Train
  attr_accessor :name
  attr_reader :speed
  attr_reader :current_station
  attr_reader :wagons
  def initialize(name)
    @name = name
    @speed = 0
    @current_num_station = 0
    @current_route_stations = []
    @wagons = []
  end
  #набирает скорость
  def train_go(speed)
    @speed += speed
  end
  # тормозит
  def stop
    @speed = 0
  end
  # принимает маршрут следования
  def take_route(route)
    @current_route = route
    @current_station = @current_route.stations[0]
    @current_station.add_train(self)
  end
  # перемещение между станциями(по 1 за раз)
  def next_station
    @current_station.send_train(self)
    @current_num_station += 1
    @current_station = @current_route.stations[@current_num_station]
    @current_station.add_train(self)
  end
  #возвращает предыдущую станцию
  def return_previous_station
    @current_route[@current_num_station - 1]
  end
  #возвращает следущую станцию
  def return_next_station
    @current_route[@current_num_station + 1]
  end
end

