require 'pg'
require './lib/spaces'

describe Spaces do

  describe '#==' do
    it 'matching ids are identical' do
      user = Users.create(email: 'test@example.com', password: 'password123', name: 'Test name', username: 'testusername')
      user_id = user.id
      space = Spaces.new(999, 'Lucys House','test@test.com', 'this is a house description for lucys house', 40.00, "hi",user_id)
      space1 = Spaces.new(999, 'Lucys House','test@test.com', 'this is a house description for lucys house', 40.00, "hi", user_id)

      expect(space).to eq(space1)
    end
  end

  describe '.create' do
    it 'creates a space' do
      user = Users.create(email: 'test@example.com', password: 'password123', name: 'Test name', username: 'testusername')
      user_id = user.id
      space = Spaces.create(name_of_space: 'Lucys House',email: 'test@test.com', description: 'this is a house description for lucys house', price_per_night: 40.00, user_id: user_id)
      expect(Spaces.all).to include space
    end
  end

  describe '.all' do
    it 'returns all spaces' do
      user = Users.create(email: 'test@example.com', password: 'password123', name: 'Test name', username: 'testusername')
      user_id = user.id
      space0 = Spaces.create(name_of_space: 'Lucys House',email: 'test@test.com', description: 'this is a house description for lucys house', price_per_night: 40.00, user_id: user_id)
      space1 = Spaces.create(name_of_space: 'Bens House',email: 'test@test.com', description: 'this is a house description for bens house', price_per_night: 40.00, user_id: user_id)
      space2 = Spaces.create(name_of_space: 'Lauras House',email: 'test@test.com', description: 'this is a house description for lauras house', price_per_night: 40.00, user_id: user_id)
      space3 = Spaces.create(name_of_space: 'Khies House',email: 'test@test.com', description: 'this is a house description for khies house', price_per_night: 40.00, user_id: user_id)

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
      user = Users.create(email: 'test@example.com', password: 'password123', name: 'Test name', username: 'testusername')
      user_id = user.id
      space = Spaces.create(name_of_space: 'Lucys House',email: 'test@test.com', description: 'this is a house description for lucys house', price_per_night: 40.00, user_id: user_id)
      expect(Spaces.find(space.id)).to eq space
    end
  end


end
