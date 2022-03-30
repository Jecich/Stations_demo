require_relative 'train'
require_relative 'route'
require_relative 'station'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'passenger_wagon'
require_relative 'cargo_wagon'


class Main
  def initialize
    @stations = []
    @routes = []
    @trains = []
    @wagons = []
  end

  def start
    loop do
      action = action_interface
      if action == "exit"
        break
      end
      process_actions(action)
    end
  end

  def action_interface
    puts "Выберите действие"
    puts "1 - создать станцию"
    puts "2 - создать поезд"
    puts "3 - создать маршрут"
    puts "4 - добавить станцию в маршрут"
    puts "5 - удалить станцию из маршрута"
    puts "6 - назначить поезду маршрут"
    puts "7 - создать вагон"
    puts "8 - добавить вагон к поезду"
    puts "9 - отцепить вагон от поезда"
    puts "10 - переместить поезд на станцию вперед"
    puts "11 - список всех станций"
    puts "12 - список всех поездов на станции"
    puts "exit - завершить процесс"
    action = gets.chomp.to_s
  end

  def process_actions(action)
    case action
    when "1"
      create_station
    when "2"
      create_train
    when "3"
      create_route
    when "4"
      add_remove_station_to_route("add")
    when "5"
      add_remove_station_to_route("delete")
    when "6"
      train_take_route
    end

  end

  #создать станцию
  def create_station
    puts "Введите название станции:"
    name = gets.chomp
    name = Station.new(name)
    puts "Создана станция #{name}"
    @stations << name
  end

  #создать поезд
  def create_train
    puts "Выберите тип поезда:"
    puts "1 - пассажирский"
    puts "2 - грузовой"
    type = gets.chomp.to_s
    if type == "1"
      puts "Введите номер поезда:"
      name = gets.chomp.to_s
      name = PassengerTrain.new(name)
      @trains << name
      puts "Создан новый пассажирский поезд #{name}"
    elsif type == "2"
      puts "Введите название поезда: "
      name = gets.chomp.to_s
      name = CargoTrain.new(name)
      @trains << name
      puts "Создан новый грузовой поезд #{name}"
    else
      puts "Введен неверный тип поезда"
    end
  end

  #создать маршрут
  def create_route
    puts "Введите название маршрута:"
    name = gets.chomp.to_s
    puts "Введите первую станцию маршрута:"
    first_station = gets.chomp.to_s
    puts "Введите последнюю станцию маршрута:"
    last_station = gets.chomp.to_s
    first_station_num = 123
    last_station_num = 1231
    @stations.each do |station|
      if first_station == station.name
        first_station_num = @stations.index(station)
        if last_station == station.name
          last_station_num = @stations.index(station)
        end
        name = Route.new(name, @stations[first_station_num], @stations[last_station_num])
        @routes << name
        puts "Создан новый маршрут #{@routes[-1]}"
      else
        puts "Такой станции не существует!"
      end
    end


  end

  #удалить или добавить станцию на маршрут
  def add_remove_station_to_route(action)
    puts "Введите нужный маршрут:"
    route = gets.chomp.to_s
    puts "Введите станцию:"
    station = gets.chomp.to_s
    @routes.each do |cur_route|
      @stations.each do |cur_station|
      if cur_route.name == route and cur_station.name == station
        if action == "add"
          cur_route.add_station(cur_station)
          puts "На маршрут #{route} добавлена станция #{station}"
        end
      elsif action == "delete"
        cur_route.delete_station(cur_station)
        puts "Из маршрута #{route} удалена станция #{station}"
      end
      end
    end
  end

  #назначить поезду маршрут
  def train_take_route
    puts "Введите нужный маршрут"
    route = gets.chomp.to_s
    puts "Введите номер поезда"
    train_name = gets.chomp.to_s
    @routes.each do |cur_route|
      @trains.each do |cur_train|
        if cur_route.name == route and cur_train.name == train_name
          cur_train.take_route(cur_route)
          puts "Поезд с номером #{cur_train.name} принял маршрут #{cur_route.name}"
        end
      end
    end
  end


end

Main.new.start