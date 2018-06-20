require 'users'

describe Users do

  describe '#==' do
    it 'matching ids are identical' do
      user = Users.new(999, 'lucy@example.com','password0', 'Lucy', 'lucygore')
      user1 = Users.new(999, 'lucy@example.com','password0', 'Lucy', 'lucygore')

      expect(user).to eq(user1)
    end
  end

  describe '.create' do
    it 'creates a new user' do
      user = Users.create(email: 'test@example.com', password: 'password123', name: 'Test name', username: 'testusername')
      expect(user.id).not_to be_nil
    end
  end

  describe '.all' do
    it 'returns all users' do

      user0 = Users.create(email: 'lucy@example.com', password: 'password0', name: 'Lucy', username: 'lucygore')
      user1 = Users.create(email: 'ben@example.com', password: 'password1', name: 'Ben', username: 'bentomkins')
      user2 = Users.create(email: 'laura@example.com', password: 'password2', name: 'Laura', username: 'laurapetre')
      user3 = Users.create(email: 'khie@example.com', password: 'password3', name: 'Khie', username: 'khiebiggs')

      expected_users = [
        user0,
        user1,
        user2,
        user3
      ]

      expect(Users.all).to eq expected_users
    end
  end

  describe '.find' do
    it 'finds a user' do
      user = Users.create(email: 'lucy@example.com', password: 'password0', name: 'Lucy', username: 'lucygore')
      expect(Users.find(user.id)).to eq user
    end
  end

  describe '.authenticate' do
    it 'returns a user given a correct email and password if one exists' do
      user = Users.create(email: 'lucy@example.com', password: 'password0', name: 'Lucy', username: 'lucygore')
      authenticated_user = Users.authenticate(email: 'lucy@example.com', password: 'password0')

      expect(authenticated_user.id).to eq user.id
    end
  end

end
