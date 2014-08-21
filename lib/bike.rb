class Bike

  attr_reader :time, :serial

  def initialize
    @broken = false
    @serial = serial_generate
    @time = nil 
  end

  def broken?
    @broken
  end

  def break!
    @broken = true
    self
  end
  
  def fix!
    @broken = false
    self
  end

  def serial_generate
    (0..9).map { rand(0..9) }.join
  end

  def time!
    @time = Time.now
  end
end
