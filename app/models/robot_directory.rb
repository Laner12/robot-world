class RobotDirectory
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def create(robot)
    # database.transaction do
    #   database['robots'] ||= []
    #   database['total'] ||= 0
    #   database['total'] += 1
    #   database['robots'] << { "id" => database['total'],
    #                           "name" => robot[:name],
    #                           "city" => robot[:city],
    #                           "state" => robot[:state],
    #                           "avatar" => robot[:avatar],
    #                           "birthdate" => robot[:birthdate],
    #                           "date_hired" => robot[:date_hired],
    #                           "department" => robot[:department] }
    # end
    database.execute("INSERT INTO robots (name, city, state,
                      birthdate, date_hired, department)
                      VALUES (?, ?, ?, ?, ?, ?);",
                      robot[:name], robot[:city], robot[:state],
                       robot[:birthdate], robot[:date_hired],
                        robot[:department])
  end

  def raw_robots
    database.execute("SELECT * FROM robots;")
    # database.transaction do
    #   database['robots'] || []
    # end
  end

  def all
    raw_robots.map { |data| Robot.new(data) }
  end

  def raw_robot(id)
    raw_robots.find { |robot| robot["id"] == id }
  end

  def find(id)
    Robot.new(raw_robot(id))
  end

  def update(id, robot)
    # database.transaction do
    #   target_robot = database['robots'].find { |data| data["id"] == id}
    #   target_robot["name"]       = robot[:name]
    #   target_robot["city"]       = robot[:city]
    #   target_robot["state"]      = robot[:state]
    #   target_robot["avatar"]     = robot[:avatar]
    #   target_robot["birthdate"]  = robot[:birthdate]
    #   target_robot["date_hired"] = robot[:date_hired]
    #   target_robot["department"] = robot[:department]
    # end
    database.execute("UPDATE robots name= ?, city= ?, state= ?,
                      birthdate= ?, date_hired= ?, department= ?
                      WHERE id = ?;",
                      robot[:name], robot[:city], robot[:state],
                      robot[:birthdate], robot[:date_hired],
                      robot[:department], id)
  end

  def destroy(id)
    # database.transaction do
    #   database['robots'].delete_if { |robot| robot["id"] == id }
    # end
    database.execute("DELETE FROM robots WHERE id= ?;", id)
  end

  def delete_all
    database.execute("DELETE FROM robots")
  end
end
