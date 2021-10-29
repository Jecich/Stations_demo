class Route
  attr_reader :stations
  def initialize(first_station, end_station)
    @stations = []
    @stations << first_station
    @stations << end_station
    @station_num = 1
  end
  #добавить станцию
  def add_station(station)
    @stations.insert(-1,station)
    @station_num += 1
  end
  #удалить станцию
  def delete_station(station)
    @stations.delete(station)
  end
end
