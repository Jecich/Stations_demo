class PassengerWagon
  attr_reader :name
  attr_reader :type
  def initialize(name)
    @name = name
    @type = "passenger"
  end
end