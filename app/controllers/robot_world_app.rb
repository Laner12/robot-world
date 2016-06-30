require_relative "../models/robot_directory"
require_relative "../models/robot"

class RobotWorldApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)
  set :method_override, true

  get "/" do
    erb :dashboard
  end

  get "/robots" do
    @robots = robot_directory.all
    erb :index
  end

  get "/robots/new" do
    erb :new
  end

  post "/robots" do
    robot_directory.create(params[:robot])
    redirect "/robots"
  end

  get "/robots/:id/edit" do |id|
    @robot = robot_directory.find(id.to_i)
    erb :edit
  end

  get "/robots/:id" do |id|
    @robot = robot_directory.find(id.to_i)
    erb :show
  end

  put "/robots/:id" do |id|
    robot_directory.update(id.to_i, params[:robot])
    redirect "/robots/#{id}"
  end

  delete "/robots/:id" do |id|
    robot_directory.destroy(id.to_i)
    redirect "/robots"
  end

  def robot_directory
  database = YAML::Store.new('db/robot_directory')
  @robot_directory ||= RobotDirectory.new(database)
  end
end
