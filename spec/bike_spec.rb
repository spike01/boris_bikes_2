require 'bike'

describe Bike do

  let(:bike) { Bike.new }
  
  context 'Breaking' do
    it 'is not broken on initialization' do
      expect(bike.broken?).to be false
    end

    it 'is able to break' do
      expect(bike.break!).to be_broken
    end

    it 'able to be fixed' do
      expect(bike.break!.fix!).to_not be_broken
    end
  end 

  context 'Serial number' do
    it 'is initialized with a serial number' do
      expect(bike.serial).not_to eq(nil) 
    end

    it 'has a unique serial number' do
      expect(bike.serial).not_to eq(Bike.new.serial)
    end
    
    it 'has a valid serial number' do
      expect(bike.serial).to match(/\d{9}/)
    end
  end

  context 'Time' do
    it 'can hold a time variable' do
      bike.time!
      expect(bike.time.round(0).to eq Time.now.round(0) 
    end
  end
end
