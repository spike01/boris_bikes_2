require 'docking_station'

describe DockingStation do

  let(:old_st) { DockingStation.new(capacity: 20) }
  let(:liv_pool_st) { DockingStation.new(bikes: 10) }
  let(:bike) { double :bike }
  
  def break_some_bikes(container, number)
    container.bikes.take(number).each { |bike| bike.break! }
  end

  def fill_container(container)
    container.capacity.times { container.accept(bike) }
  end

  context 'Initializing' do
    it 'can initialize with bikes inside' do
      expect(liv_pool_st.bikes.count).to eq(10)
    end
  end

  context 'Capacity' do
    it 'can initialize with a maximum capacity' do
     expect(old_st.capacity).to eq(20)
    end
    it 'can initialize with a default capacity' do
      moorgate = DockingStation.new
      expect(moorgate.capacity).to eq(30)
    end
    it 'knows when it is full' do
      fill_container(old_st)
      expect(old_st.full?).to be true
    end
  end

  context 'Docking and releasing' do
    it 'can accept a bike' do
      old_st.accept(bike)
      expect(old_st.bikes.count).to eq(1)
    end
    
    it 'can release a bike' do
      old_st.accept(bike)
      old_st.release
      expect(old_st.bikes.count).to eq(0)
    end
  end

  context 'Providing lists of bikes' do
    it 'knows which of its bikes are available' do
      break_some_bikes(liv_pool_st, 5)
      expect(liv_pool_st.available_bikes.count).to eq(5)
    end

    it 'knows which of its bikes are broken' do
      break_some_bikes(liv_pool_st, 4)
      expect(liv_pool_st.broken_bikes.count).to eq(4)
    end
  end
end
