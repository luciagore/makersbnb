require 'pg'
require './lib/spaces'

describe Spaces do
  describe '.create' do
    it 'enables a user to list the name of space' do
      space = Spaces.create(name_of_space: 'Lucys House', email: "hi@hi.com",description: 'this is a house description for lucys house')
      expect(Spaces.all).to include space
    end
  end

  describe '#==' do
    it 'checks that matching ids are identical' do
      space = Spaces.new(999, 'Lucys House','hi@hi.com', description: 'this is a house description for lucys house')
      space1 = Spaces.new(999, 'Lucys House','hi@hi.com', description: 'this is a house description for lucys house')

      expect(space).to eq(space1)
    end
  end


end
