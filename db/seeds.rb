# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

names = %w[Jeremy Margaret Pat Ahmed]
employees = []
names.each do |name|
  employees << Employee.create(name: name, email: "#{name.downcase}@big.com.au", status: rand(2))
end

task_names = ['Do the code test', 'Review the code test', 'High 5!']
tasks = []
task_names.each_with_index do |task, index|
  due_date = Time.now + 1.day
  tasks << Task.create(name: task, execution_date: due_date + index.days)
end

# Do the code test - Jeremy
task = tasks.find { |val| val[:name] == task_names[0] }
employees.find { |val| val[:name] == names[0] }.tasks << task

# Review the code test - Margaret, Pat and Ahmed
task = tasks.find { |val| val[:name] == task_names[1] }
employees.find_all { |val| names.slice(1..3).include?(val[:name]) }.each do |e|
  e.tasks << task
end

# High 5! - Everyone
task = tasks.find { |val| val[:name] == task_names[2] }
employees.each do |e|
  e.tasks << task
end

# create a task that will be in the past after seeding for testing API
employees.find do |val|
  val[:name] == names[0]
end.tasks << Task.create(name: 'A task in the past', execution_date: Time.now + 1.second)
