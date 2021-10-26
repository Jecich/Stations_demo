require_relative 'train'
require_relative 'route'
require_relative 'station'

train1 = Train.new(42, "cargo", 4)
train2 = Train.new(43, "cargo", 5)

puts train1.return_type

msk = Station.new("msk")
pp = Station.new("pp")



blue = Route.new(msk, pp)

train1.take_route(blue)
train1.next_station
train1.return_current_station

puts blue.return_all_station



