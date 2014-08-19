class Person

  def initialize(bike=nil)
    @bike = bike
  end

  def has_bike?
    !@bike.nil?
  end
  
  def get_bike_from(station)
    @bike = station.release_bike
  end
  
  def return_bike_to(station)
    station.return_bike
  end

end
