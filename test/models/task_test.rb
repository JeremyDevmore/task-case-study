require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  setup do
    @task = tasks(:two)
  end

  test 'should create a new Task' do
    task = Task.new(name: 'Do the thing', execution_date: Time.now + 1.day)
    assert task.save
  end

  test 'should have 2 employees' do
    employee_count = @task.employees.count
    assert employee_count == 2
  end
end
