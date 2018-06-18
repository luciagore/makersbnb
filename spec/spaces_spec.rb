require 'pg'
require './lib/spaces'

describe Spaces do

  describe '#==' do
    it 'matching ids are identical' do
      space = Spaces.new(999, 'Lucys House', description: 'this is a house description for lucys house')
      space1 = Spaces.new(999, 'Lucys House', description: 'this is a house description for lucys house')

      expect(space).to eq(space1)
    end
  end

  describe '.create' do
    it 'creates a space' do
      space = Spaces.create(name_of_space: 'Lucys House', description: 'this is a house description for lucys house')
      expect(Spaces.read).to include space
    end
  end

  describe '.read' do
    it 'returns all spaces' do
      space0 = Spaces.create(name_of_space: 'Lucys House', description: 'this is a house description for lucys house')
      space1 = Spaces.create(name_of_space: 'Bens House', description: 'this is a house description for bens house')
      space2 = Spaces.create(name_of_space: 'Lauras House', description: 'this is a house description for lauras house')
      space3 = Spaces.create(name_of_space: 'Khies House', description: 'this is a house description for khies house')

      expected_spaces = [
        space0,
        space1,
        space2,
        space3
      ]

      expect(Spaces.read).to eq expected_spaces
    end
  end

  describe '.find' do
    it 'finds a space' do
      Spaces.create(name_of_space: 'Bens House', description: 'hello')
      space = Spaces.find(1)

      expect(space.name_of_space).to eq "Bens House"
      expect(space.description).to eq "hello"

    end
  end


end
