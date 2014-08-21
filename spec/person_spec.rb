require 'person'

describe Person do

  let(:person) { Person.new }
  let(:station) { double :station }
  let(:bike) { double :bike }
  let(:person2) { Person.new(bike) }

  context 'Initialization' do
    it 'is initialized without a bike' do
      expect(person).to_not have_bike
    end

    it 'can get a bike' do
      expect(person2).to have_bike
    end
  end

  context 'Getting bikes' do
    it 'can ask a station to release a bike' do
     expect(station).to receive(:release_bike)
     person.get_bike_from(station) 
    end
    it 'can get a bike after station releases bike' do
      allow(station).to receive(:release_bike).and_return(:bike)
      person.get_bike_from(station)
      expect(person).to have_bike
    end
  end

  context 'Returning bikes' do
    it 'can ask a station to accept a bike' do
      expect(station).to receive(:return_bike)
      person.return_bike_to(station)
    end
    it 'has no bike after returning a bike' do
      allow(station).to receive(:return_bike).and_return(nil)
      person2.return_bike_to(station)
      expect(person2).not_to have_bike
    end
  end

  context 'Breaking bikes' do
    it 'can break a bike' do
      expect(bike).to receive(:break!)
      person2.fall_down
    end
  end
end

