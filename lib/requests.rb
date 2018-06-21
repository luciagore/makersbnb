require 'pg'

class Requests

  attr_reader :id, :body, :email, :timestamp, :space_id, :user_id

  def initialize(id, space_id, body, email, timestamp, user_id)
    @id = id
    @space_id = space_id
    @body = body
    @email = email
    @timestamp = timestamp
    @user_id = user_id
  end


  def ==(request)
    @id == request.id
  end


  def self.create(request)
    sql_query = "INSERT INTO requests (space_id, body, email, user_id)
                 VALUES('#{request[:space_id]}','#{request[:body]}','#{request[:email]}', '#{request[:user_id]}')
                 RETURNING id, space_id, body, email, timestamp, user_id"

    result = database.exec(sql_query)
    request = Requests.new(
      result.first['id'],
      result.first['space_id'],
      result.first['body'],
      result.first['email'],
      result.first['timestamp'],
      result.first['user_id']
    )
    space = Spaces.find(request.space_id)
    Mailer.sendmail({about: space.name_of_space, message: request.body, from: request.email, to: space.email})
    return request
  end


  def self.all
    sql_query = "SELECT * FROM Requests"
    database.exec(sql_query).map { |request|
      Requests.new(
        request['id'],
        request['space_id'],
        request['body'],
        request['email'],
        request['timestamp'],
        request['user_id']
        )
       }
  end


  def self.find(id)
    sql_query = "SELECT * FROM Requests
                 WHERE id = #{id}"

    database.query(sql_query).map { |request|
     Requests.new(
       request['id'],
       request['space_id'],
       request['body'],
       request['email'],
       request['timestamp'],
       request['user_id']
      )
    }.first
  end

  def to_hash
    {
      space_id: @space_id,
      body: @body,
      email: @email,
      user_id: @user_id
    }
  end

  private_class_method def self.database
    ENV['ENVIROMENT'] == 'test' \
      ? PG.connect(dbname: 'makersbnb_test') \
      : PG.connect(dbname: 'makersbnb')
  end

end
