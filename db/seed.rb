require "sqlite3"

database = SQLite3::Database.new("db/robot_directory_development.db")

database.execute("DELETE FROM robots")

database.execute(
                "INSERT INTO robots
                (name, city, state, birthdate, date_hired, department)
                VALUES ('George', 'Denver', 'Colorado', '10/10/10', '11/11/11', 'work-horse'),
                ('Sandy', 'Littleton', 'Colorado', '09/09/09', '10/10/10', 'encourager'),
                ('Timothy', 'city', 'state', '12/12/12', '12/12/12', 'typist');")
                puts "It worked and:"
puts database.execute("SELECT * FROM robots;")
