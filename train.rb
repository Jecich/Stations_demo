class Train


  def initialize(name, type, wagons)
    @name = name
    @speed = 0
    if type == "cargo" or type == "passenger"
      @type = type
    else
      puts "Неверно указан тип поезда"
    end
    @wagons = wagons.to_i
    @current_num_station = 0
    @current_route_stations = []
  end

  #возвращает имя позда
  def return_name
    @name
  end

  #возвращает тип поезда
  def return_type
    @type
  end
  #набирает скорость
  def train_go(speed)
    @speed += speed
  end
  # возвращает текущую скорость
  def return_speed
    @speed
  end
  # тормозит
  def stop
    @speed = 0
  end
  # возвращает кол-во вагонов
  def return_count_wagons
    @wagons
  end
  # отцпляет вагоны(нельзя пока движется)
  def delete_wagon
    if @speed == 0
      @wagons -= 1
    else
      puts "Нельзя отцеплять вагоны во время движения поезда!"
    end
  end
  # прицепляет вагоны(нельзя пока движется)
  def add_wagon
    if @speed == 0
      @wagons += 1
    else
      puts "Нельзя прицеплять вагоны во время движения поезда!"
    end
  end
  # принимает маршрут следования
  def take_route(route)
    @current_route = route
    @current_station = @current_route.return_all_station[0]
  end

  # перемещение между станциями(по 1 за раз)
  def next_station
    @current_num_station += 1
    @current_station = @current_route.return_all_station[@current_num_station]

  end

  #возвращает предыдущую станцию
  def return_previous_station
    @current_route[@current_num_station - 1]
  end

  #возвращает текущую станцию
  def return_current_station
    @current_station
  end

  def return_next_station
    @current_route[@current_num_station + 1]
  end

end