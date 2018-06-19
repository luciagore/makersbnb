require 'pg'
require './lib/requests'

describe Requests do

  describe '#==' do
    it 'matching ids are identical' do
      space = Spaces.create(name_of_space: 'Lucys House', email: 'test@test.com', description: 'this is a house description for lucys house')
      request = Requests.new(999, space.id, 'createrequest@yahoo.com', 'this is a house body for lucys house', '2018-06-10 10:27:58.348763')
      request1 = Requests.new(999, space.id, 'createrequest@yahoo.com', 'this is a house body for lucys house', '2018-06-10 10:27:58.348763')

      expect(request).to eq(request1)
    end
  end

  describe '.create' do
    it 'creates a request' do
      space = Spaces.create(name_of_space: 'Lucys House', email: 'test@test.com', description: 'this is a house description for lucys house')
      request = Requests.create(space_id: space.id, email: 'createrequest@yahoo.com', body: 'this is a house body for lucys house')
      expect(Requests.all).to include request
    end
  end

  describe '.all' do
    it 'returns all requests' do
      space = Spaces.create(name_of_space: 'Lucys House', email: 'test@test.com', description: 'this is a house description for lucys house')
      request0 = Requests.create(space_id: space.id, email: 'createrequest@yahoo.com', body: 'this is a house body for lucys house')
      request1 = Requests.create(space_id: space.id, email: 'createrequest@yahoo.com', body: 'this is a house body for bens house')

      expected_requests = [
        request0,
        request1,
      ]

      expect(Requests.all).to eq expected_requests
    end
  end

  describe '.find' do
    it 'finds a request' do
      space = Spaces.create(name_of_space: 'Lucys House', email: 'test@test.com', description: 'this is a house description for lucys house')
      request = Requests.create(space_id: space.id, email: 'createrequest@yahoo.com', body: 'this is a house body for lucys house')
      expect(Requests.find(request.id)).to eq request
    end
  end

end
