require_relative 'train'
class PassengerTrain < Train
  attr_reader :type
  def initialize(name)
    @name = name
    @type = "passenger"
    super
  end
  #Прицепить вагон
  def attach_wagon(wagon)
    if wagon.type == "passenger"
      @wagons << wagon
    else
      puts "Ошибка! Неверный тип вагона"
    end
  end
  #Отцепить
  def delete_wagon(name)
    @wagons.each do |wagon|
      if wagon.name == name
        @wagons.delete(wagon)
      end
    end
  end
end
