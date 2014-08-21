require 'docking_station'

describe DockingStation do

  let(:old_st) { DockingStation.new }
  let(:bike) { double :bike }
  

  context 'Docking and releasing' do
    it 'can dock a bike' do
      old_st.dock(bike)
      expect(old_st.bikes.count).to eq 1
    end
    
    it 'can release a bike' do
      old_st.dock(bike)
      old_st.release
      expect(old_st.bikes.count).to eq 0
    end
  end
end
