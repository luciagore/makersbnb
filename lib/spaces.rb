require 'pg'

class Spaces

  attr_reader :id, :name_of_space, :description, :email

  def initialize(id, name_of_space, email, description)
    @id = id
    @name_of_space = name_of_space
    @description = description
    @email = email
  end


  def ==(space)
    @id == space.id
  end


  def self.create(create)
    sql_query = "INSERT INTO spaces (name_of_space, email, description)
                 VALUES('#{create[:name_of_space]}', '#{create[:email]}', '#{create[:description]}')
                 RETURNING id, name_of_space, email, description"

    result = database.exec(sql_query)
    Spaces.new(
      result.first['id'],
      result.first['name_of_space'],
      result.first['email'],
      result.first['description']
    )
  end


  def self.all
    sql_query = "SELECT * FROM spaces"
    database.exec(sql_query).map { |space|
      Spaces.new(
        space['id'],
        space['name_of_space'],
        space['email'],
        space['description']
        )
       }
  end

  def self.find(id)
    sql_query = "SELECT * FROM Spaces
                 WHERE id = #{id}"

    database.query(sql_query).map { |space|
     Spaces.new(space['id'], space['name_of_space'], space['email'], space['description']) }.first
  end

  def to_hash
    {
      id: @id,
      name_of_space: @name_of_space,
      email: @email,
      description: @description
    }
  end


  private_class_method def self.database
    ENV['ENVIROMENT'] == 'test' \
      ? PG.connect(dbname: 'makersbnb_test') \
      : PG.connect(dbname: 'makersbnb')
  end


end
