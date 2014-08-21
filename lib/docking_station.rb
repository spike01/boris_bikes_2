class DockingStation

  attr_accessor :bikes

  def initialize( options = {} )
    @bikes ||= []
  end

  def dock(bike)
    @bikes << bike
  end

  def release
    @bikes.pop
  end
end
