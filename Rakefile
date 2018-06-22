require 'pg'

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

task :setup do
  # p "Creating databases..."

  ['makersbnb', 'makersbnb_test'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{database};")
    connection = PG.connect(dbname: database)

    connection.exec("CREATE TABLE users (id SERIAL PRIMARY KEY,
      email VARCHAR(60) UNIQUE, password VARCHAR(60),
      name VARCHAR(60), username VARCHAR(60) UNIQUE);")

    connection.exec("CREATE TABLE spaces(id SERIAL PRIMARY KEY,
      name_of_space VARCHAR(30),
      email VARCHAR(60),
      description VARCHAR(1000),
      price_per_night FLOAT,
      user_id INTEGER REFERENCES users (id));")

    connection.exec("CREATE TABLE requests(id SERIAL PRIMARY KEY,
      space_id INTEGER REFERENCES spaces (id),
      body VARCHAR(1000),
      email VARCHAR(60),
      timestamp TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT
      (CURRENT_TIMESTAMP AT TIME ZONE 'UTC'),
      user_id INTEGER REFERENCES users (id));")

  end
end

task :test_database_setup do
  # p "Cleaning the database..."

  connection = PG.connect(dbname: 'makersbnb_test')

  connection.exec("TRUNCATE spaces,requests, users RESTART IDENTITY;")
  # connection.exec("TRUNCATE requests RESTART IDENTITY;")
  connection.close
end

task :test_dummy do

  connection = PG.connect(dbname: 'makersbnb')
  sql_query = "INSERT INTO users (email, password, name, username)
               VALUES('lucy@example.com', 'password0', 'Lucy', 'lucygore')"
  connection.exec(sql_query)

  sql_query1 = "INSERT INTO spaces (name_of_space, email, description, price_per_night, user_id)
               VALUES('Lucy''s space',
                      'lucy@example.com',
                      'description of Lucy space',
                      '50',
                      '1')"
  connection.exec(sql_query1)
  sql_query2 = "INSERT INTO spaces (name_of_space, email, description, price_per_night, user_id)
               VALUES('Ben''s space',
                      'lucy@example.com',
                      'description of Ben space',
                      '40',
                      '1')"
  connection.exec(sql_query2)
  sql_query3 = "INSERT INTO spaces (name_of_space, email, description, price_per_night, user_id)
               VALUES('Laura''s space',
                      'lucy@example.com',
                      'description of Laura space',
                      '30',
                      '1')"
  connection.exec(sql_query3)
  sql_query4 = "INSERT INTO spaces (name_of_space, email, description, price_per_night, user_id)
               VALUES('Khie''s space',
                      'lucy@example.com',
                      'description of Khie space',
                      '20',
                      '1')"
  connection.exec(sql_query4)

end

task :teardown do
  p "Destroying databases... type 'y' to destroy the makersbnb databases."

  confirm = STDIN.gets.chomp
  return unless confirm == 'y'

  ['makersbnb', 'makersbnb_test'].each do |database|
    connection = PG.connect
    connection.exec("DROP DATABASE #{database}")
  end
end
