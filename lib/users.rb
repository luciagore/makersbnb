require 'pg'

class Users

  attr_reader :id, :email, :password, :name, :username

  def initialize(id, email, password, name, username)
    @id = id
    @email = email
    @password = password
    @name = name
    @username = username
  end

  def ==(user)
    @id == user.id
  end

  def self.create(options)
    sql_query = "INSERT INTO users (email, password, name, username)
                 VALUES('#{options[:email]}', '#{options[:password]}', '#{options[:name]}', '#{options[:username]}')
                 RETURNING id, email, password, name, username;"
    result = database.exec(sql_query)
    Users.new(
      result.first['id'],
      result.first['email'],
      result.first['password'],
      result.first['name'],
      result.first['username']
    )
  end

  def self.all
    sql_query = "SELECT * FROM users"
    database.exec(sql_query).map { |user|
      Users.new(
        user['id'],
        user['email'],
        user['password'],
        user['name'],
        user['username']
        )
       }
  end

  def self.find(id)
    sql_query = "SELECT * FROM users
                 WHERE id = #{id}"

   database.query(sql_query).map { |user|
     Users.new(
       user['id'],
       user['email'],
       user['password'],
       user['name'],
       user['username']
       )
     }.first
  end

  def to_hash
    {
      id: @id,
      email: @email,
      password: @password,
      name: @name,
      username: @username
    }
  end

  private_class_method def self.database
    ENV['ENVIROMENT'] == 'test' \
      ? PG.connect(dbname: 'makersbnb_test') \
      : PG.connect(dbname: 'makersbnb')
  end


end
