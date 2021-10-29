require_relative 'train'
require_relative 'route'
require_relative 'station'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'passenger_wagon'
require_relative 'cargo_wagon'

msk = Station.new("msk")
ps_train1 = PassengerTrain.new("32")
ps_wagon1 = PassengerWagon.new("ww")
ps_train1.attach_wagon(ps_wagon1)
msk.add_train(ps_train1)
puts msk.number_type("passenger")







