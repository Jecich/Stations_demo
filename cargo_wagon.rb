class CargoWagon
  attr_reader :name
  attr_reader :type
  def initialize(name)
    @name = name
    @type = "cargo"
  end
end