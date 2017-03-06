# require gems
require 'sinatra'
require 'sqlite3'
require "sinatra/reloader" if development?

db = SQLite3::Database.new("students.db")
db.results_as_hash = true

# write a basic GET route
# add a query parameter
# GET /
get '/' do
  "#{params[:name]} is #{params[:age]} years old."
end

# write a GET route with
# route parameters
get '/about/:person' do
  person = params[:person]
  "#{person} is a programmer, and #{person} is learning Sinatra."
end

get '/:person_1/loves/:person_2' do
  "#{params[:person_1]} loves #{params[:person_2]}"
end

# write a GET route that retrieves
# all student data
get '/students' do
  students = db.execute("SELECT * FROM students")
  response = ""
  students.each do |student|
    response << "ID: #{student['id']}<br>"
    response << "Name: #{student['name']}<br>"
    response << "Age: #{student['age']}<br>"
    response << "Campus: #{student['campus']}<br><br>"
  end
  response
end

# write a GET route that retrieves
# a particular student

get '/students/:id' do
  student = db.execute("SELECT * FROM students WHERE id=?", [params[:id]])[0]
  student.to_s
end


# write a GET route that displays an address 

get "/contact" do
  "1234 Contact Road <br> Nowhere, CA"
end

#write a GET route that displays good job

get "/great_job" do
  person=params[:name]
  p person
  if person == nil
    "Good job!"
  else
    "Good job, #{person}"
  end
end

#write a GET route that takes 2 numbers and adds them

get "/add/:num1/:num2" do
  num1 = params[:num1].to_f
  num2 = params[:num2].to_f
  ans = num1+num2
  ans.to_s
end