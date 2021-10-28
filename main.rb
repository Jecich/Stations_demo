require_relative 'train'
require_relative 'route'
require_relative 'station'

train1 = Train.new(42, "cargo", 4)
puts train1.type
msk = Station.new("msk")
pp = Station.new("pp")
blue = Route.new(msk, pp)
train1.take_route(blue)
puts train1.current_station.name
train1.next_station
puts train1.current_station.name





