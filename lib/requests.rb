require 'pg'

class Requests

  attr_reader :id, :body, :email, :timestamp

  def initialize(id, body, email, timestamp)
    @id = id
    @body = body
    @email = email
    @timestamp = timestamp
  end


  def ==(request)
    @id == request.id
  end


  def self.create(request)
    sql_query = "INSERT INTO requests (body, email)
                 VALUES('#{request[:email]}', '#{request[:body]}')
                 RETURNING id, email, body, timestamp"

    result = database.exec(sql_query)
    Requests.new(
      result.first['id'],
      result.first['body'],
      result.first['email'],
      result.first['timestamp']
    )
  end


  def self.all
    sql_query = "SELECT * FROM Requests"
    database.exec(sql_query).map { |request|
      Requests.new(
        request['id'],
        request['body'],
        request['email'],
        request['timestamp']
        )
       }
  end


  def self.find(id)
    sql_query = "SELECT * FROM Requests
                 WHERE id = #{id}"

    database.query(sql_query).map { |request|
     Requests.new(request['id'], request['body'], request['email'], request['timestamp']) }.first
  end


  private_class_method def self.database
    ENV['ENVIROMENT'] == 'test' \
      ? PG.connect(dbname: 'makersbnb_test') \
      : PG.connect(dbname: 'makersbnb')
  end

end
