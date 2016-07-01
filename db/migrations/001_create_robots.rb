require "sqlite3"

environments = ["test", "development"]

environments.each do |env|
  database = SQLite3::Database.new("db/robot_directory_#{env}.db")
  database.execute("CREATE TABLE robots (
                    id INTEGER PRIMARY KEY AUTOINCREMENT,
                    name VARCHAR(64),
                    city VARCHAR(64),
                    state VARCHAR(64),
                    birthdate VARCHAR(64),
                    date_hired VARCHAR(64),
                    department VARCHAR(64)
                    );")
                    puts "creating the database for #{env}"
end
