class Station
  attr_reader :name
  def initialize(name)
    @name = name
    @trains = []
  end
  #добавление поезда на станцию
  def add_train(train)
    @trains << train
  end
  #вывод всех поездов на станции
  def all_trains
    @trains.each do |train|
      puts "name is: #{train.name}, type is: #{train.type}"
    end
  end
  #вывод количества грузовых или пассажирских поездов
  def number_type(type)
    @trains.map do |train|
      ["name is: #{train.name}, type is: #{train.type}"] if train.type == type
    end.compact
  end
  #отправить поезд
  def send_train(name)
    @trains.each do |train|
      if train.name == name
        @trains.delete(train)
      end
    end
  end
end
