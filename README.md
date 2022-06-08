# README

# Testing

database: postgresql

bundle install, create/migrate/seed database, run server

##### All employees endpoint

http://localhost:3000/employees

##### Active employees endpoint

http://localhost:3000/employees?employee[status]=active

##### Employee all tasks endpoint - /tasks/:employee_id

http://localhost:3000/tasks/1

##### Employee future tasks endpoint - /tasks/:employee_id?employee[future]

http://localhost:3000/tasks/1?employee[future]

### Bonus - Task can belong to multiple employees

    test 'should have 2 employees' do
      employee_count = @task.employees.count
      assert employee_count == 2
    end`
