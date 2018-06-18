require 'pg'

class Spaces

  attr_reader :id, :name_of_space, :description

  def initialize(id, name_of_space, description)
    @id = id
    @name_of_space = name_of_space
    @description = description
  end


  def ==(space)
    @id == space.id
  end


  def self.create(create)
    sql_query = "INSERT INTO spaces (name_of_space, description)
                 VALUES('#{create[:name_of_space]}', '#{create[:description]}')
                 RETURNING id, name_of_space, description"

    result = database.exec(sql_query)
    Spaces.new(result.first['id'], result.first['name_of_space'], result.first['description'])
  end


  def self.read
    sql_query = "SELECT * FROM spaces"
    database.exec(sql_query).map { |space|
      Spaces.new(space['id'], space['name_of_space'], space['description']) }
  end



  private_class_method def self.database
    ENV['ENVIROMENT'] == 'test' \
      ? PG.connect(dbname: 'makersbnb_test') \
      : PG.connect(dbname: 'makersbnb')
  end


end
