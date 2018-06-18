require 'pg'
require './lib/spaces'

describe Spaces do

  describe '#==' do
    it 'matching ids are identical' do
      space = Spaces.new(999, 'Lucys House','test@test.com', description: 'this is a house description for lucys house')
      space1 = Spaces.new(999, 'Lucys House','test@test.com', description: 'this is a house description for lucys house')

      expect(space).to eq(space1)
    end
  end

  describe '.create' do
    it 'creates a space' do
      space = Spaces.create(name_of_space: 'Lucys House', description: 'this is a house description for lucys house')
      expect(Spaces.all).to include space
    end
  end

  describe '.all' do
    it 'returns all spaces' do
      space0 = Spaces.create(name_of_space: 'Lucys House',email: 'test@test.com', description: 'this is a house description for lucys house')
      space1 = Spaces.create(name_of_space: 'Bens House',email: 'test@test.com', description: 'this is a house description for bens house')
      space2 = Spaces.create(name_of_space: 'Lauras House',email: 'test@test.com', description: 'this is a house description for lauras house')
      space3 = Spaces.create(name_of_space: 'Khies House',email: 'test@test.com', description: 'this is a house description for khies house')

      expected_spaces = [
        space0,
        space1,
        space2,
        space3
      ]

      expect(Spaces.all).to eq expected_spaces
    end
  end

  describe '.find' do
    it 'finds a space' do
      space = Spaces.create(name_of_space: 'Lucys House',email: 'test@test.com', description: 'this is a house description for lucys house')
      expect(Spaces.find(space.id)).to eq space
    end
  end


end
