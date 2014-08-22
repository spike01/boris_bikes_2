class DockingStation

  DEFAULT_CAPACITY = 30
  
  attr_accessor :bikes, :capacity 

  def initialize( options = {} )
    @bikes ||= []
    @location 
    initialized_bikes = options.fetch(:bikes, 0)
    initialized_bikes.times { bikes << Bike.new }
    @capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
  end

  def accept(bike)
    raise "Sorry, at capacity" if full?
    raise "Sorry, this is not a bike" if bike.class != Bike 
    @bikes << bike
  end

  def release
    raise "Sorry, no bikes available" if empty?
    @bikes.pop
  end

  def available_bikes
    bikes.reject { |bikes| bikes.broken? }
  end

  def broken_bikes
    bikes.select { |bikes| bikes.broken? }
  end

  def full?
    bikes.count == capacity
  end

  def empty?
    bikes.empty? == true
  end
end
