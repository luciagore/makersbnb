require 'pg'
require './lib/requests'

describe Requests do

  describe '#==' do
    it 'matching ids are identical' do
      request = Requests.new(999, 'createrequest@yahoo.com', body: 'this is a house body for lucys house')
      request1 = Requests.new(999, 'createrequest@yahoo.com', body: 'this is a house body for lucys house')

      expect(request).to eq(request1)
    end
  end

  describe '.create' do
    it 'creates a request' do
      request = Requests.create(email: 'createrequest@yahoo.com', body: 'this is a house body for lucys house')
      expect(Requests.all).to include request
    end
  end

  describe '.all' do
    it 'returns all requests' do
      request0 = Requests.create(email: 'createrequest@yahoo.com', body: 'this is a house body for lucys house')
      request1 = Requests.create(email: 'createrequest@yahoo.com', body: 'this is a house body for bens house')

      expected_requests = [
        request0,
        request1,
      ]

      expect(Requests.all).to eq expected_requests
    end
  end

  describe '.find' do
    it 'finds a request' do
      request = Requests.create(email: 'createrequest@yahoo.com', body: 'this is a house body for lucys house')
      expect(Requests.find(request.id)).to eq request
    end
  end

end
