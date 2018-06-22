require 'pg'

class Spaces

  attr_reader :id, :name_of_space, :description, :email, :price_per_night, :user_id, :image_name

  def initialize(id, name_of_space, email, description, price_per_night, image_name, user_id)
    @id = id
    @name_of_space = name_of_space
    @email = email
    @description = description
    @price_per_night = price_per_night
    @user_id = user_id
    @image_name = image_name
  end


  def ==(space)
    @id == space.id
  end


  def self.create(create)
    sql_query = "INSERT INTO spaces (name_of_space, email, description, price_per_night, image_name, user_id)
                 VALUES('#{create[:name_of_space]}', '#{create[:email]}',
                   '#{create[:description]}', '#{create[:price_per_night]}', '#{create[:image_name]}', '#{create[:user_id]}')
                 RETURNING id, name_of_space, email, description, price_per_night, image_name, user_id"

    result = database.exec(sql_query)
    Spaces.new(
      result.first['id'],
      result.first['name_of_space'],
      result.first['email'],
      result.first['description'],
      result.first['price_per_night'],
      result.first['image_name'],
      result.first['user_id']
    )
  end


  def self.all
    sql_query = "SELECT * FROM spaces"
    database.exec(sql_query).map { |space|
      Spaces.new(
        space['id'],
        space['name_of_space'],
        space['email'],
        space['description'],
        space['price_per_night'],
        space['image_name'],
        space['user_id']
        )
       }
  end

  def self.find(id)
    sql_query = "SELECT * FROM Spaces
                 WHERE id = #{id}"

    database.query(sql_query).map { |space|
     Spaces.new(space['id'], space['name_of_space'], space['email'],
       space['description'], space['price_per_night'], space['image_name'], space['user_id']) }.first
  end

  def to_hash
    {
      id: @id,
      name_of_space: @name_of_space,
      email: @email,
      description: @description,
      price_per_night: @price_per_night,
      image_name: @image_name,
      user_id: @user_id
    }
  end


  private_class_method def self.database
    ENV['ENVIROMENT'] == 'test' \
      ? PG.connect(dbname: 'makersbnb_test') \
      : PG.connect(dbname: 'makersbnb')
  end


end
