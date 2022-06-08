require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase
  setup do
    @employee = employees(:one)
  end

  def future_tasks
    tasks.includes(:assigned_tasks).where('assigned_tasks.employee_id = ? AND execution_date > ?', id,
                                          Time.now).references(:assigned_tasks)
  end

  test 'should save a new employee' do
    employee = Employee.new(name: 'dd', email: 'd@d.com', status: 1)
    assert employee.save
  end

  test 'should fail to save new employee' do
    employee = Employee.new(name: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', email: 'd@d.com',
                            status: 1)
    assert_not employee.save
  end

  test 'should have future tasks' do
    future_tasks = Task.includes(:assigned_tasks).where('assigned_tasks.employee_id = ? AND execution_date > ?', @employee.id,
                                                        Time.now).references(:assigned_tasks)
    assert future_tasks.length > 0
  end
end
