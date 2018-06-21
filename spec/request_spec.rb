require 'pg'
require './lib/requests'

describe Requests do

  describe '#==' do
    it 'matching ids are identical' do
      user = Users.create(email: 'test@example.com', password: 'password123', name: 'Test name', username: 'testusername')
      user_id = user.id
      space = Spaces.create(name_of_space: 'Lucys House', email: 'test@test.com', description: 'this is a house description for lucys house', price_per_night: 40.00, user_id: user_id)
      space_id = space.id
      request = Requests.new(999, space_id, 'createrequest@yahoo.com', 'this is a house body for lucys house', '2018-06-10 10:27:58.348763', user_id)
      request1 = Requests.new(999, space_id, 'createrequest@yahoo.com', 'this is a house body for lucys house', '2018-06-10 10:27:58.348763', user_id)

      expect(request).to eq(request1)
    end
  end

  describe '.create' do
    it 'creates a request' do
      user = Users.create(email: 'test@example.com', password: 'password123', name: 'Test name', username: 'testusername')
      user_id = user.id
      space = Spaces.create(name_of_space: 'Lucys House', email: 'test@test.com', description: 'this is a house description for lucys house', price_per_night: 40.00, user_id: user_id)
      space_id = space.id
      request = Requests.create(space_id: space_id, email: 'createrequest@yahoo.com', body: 'this is a house body for lucys house', user_id: user_id)
      expect(Requests.all).to include request
    end
  end

  describe '.all' do
    it 'returns all requests' do
      user = Users.create(email: 'test@example.com', password: 'password123', name: 'Test name', username: 'testusername')
      user_id = user.id
      space = Spaces.create(name_of_space: 'Lucys House', email: 'test@test.com', description: 'this is a house description for lucys house', price_per_night: 40.00, user_id: user_id)
      space_id = space.id
      request0 = Requests.create(space_id: space_id, email: 'createrequest@yahoo.com', body: 'this is a house body for lucys house', user_id: user_id)
      request1 = Requests.create(space_id: space_id, email: 'createrequest@yahoo.com', body: 'this is a house body for bens house', user_id: user_id)

      expected_requests = [
        request0,
        request1,
      ]

      expect(Requests.all).to eq expected_requests
    end
  end

  describe '.find' do
    it 'finds a request' do
      user = Users.create(email: 'test@example.com', password: 'password123', name: 'Test name', username: 'testusername')
      user_id = user.id
      space = Spaces.create(name_of_space: 'Lucys House', email: 'test@test.com', description: 'this is a house description for lucys house', price_per_night: 40.00, user_id: user_id)
      space_id = space.id
      request = Requests.create(space_id: space_id, email: 'createrequest@yahoo.com', body: 'this is a house body for lucys house', user_id: user_id)
      expect(Requests.find(request.id)).to eq request
    end
  end

end
