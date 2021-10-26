class Route

  def initialize(first_station, end_station)
    @stations = []
    @stations << first_station
    @stations << end_station
    @station_num = 1
  end

  #добавить станцию
  def add_station(station)
    @stations.insert(@station_num,*station)
    @station_num += 1
  end

  #удалить станцию
  def delete_station(station)
    @stations.delete(station)
  end

  #вывести все станции
  def return_all_station
    @stations
  end
end