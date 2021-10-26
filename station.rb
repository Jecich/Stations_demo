class Station
  def initialize(name)
    @name = name
    @trains = []
  end
  #добавление поезда на станцию
  def add_train(train)
    @trains << train
  end

  #возвращает имя станции
  def return_name
    @name
  end
  #вывод всех поездов на станции
  def all_trains
    @trains.each do |i|
      puts "name is: #{i.return_name}, type is: #{i.return_type}"
    end
  end

  #вывод количества грузовых или пассажирских поездов
  def number_type(type)
    number = []
    @trains.each do |i|
      if i.return_type == type
        number << ["name is: #{i.return_name}, type is: #{i.return_type}"]
      end
    end
    puts number
  end
  #отправить поезд
  def send_train(name)
    @trains.each do |i|
      if i.return_name == name
        @trains.delete(i)
      end
    end
  end

end