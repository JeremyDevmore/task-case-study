require 'test_helper'

class EmployeesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @employee = employees(:one)
  end

  test 'should get index' do
    get employees_url, as: :json
    assert_response :success
  end

  test 'should create employee' do
    employee = Employee.new(name: 'jd', email: 'jd@jd.com')
    assert_difference('Employee.count') do
      post employees_url,
           params: { employee: { email: employee.email, name: employee.name, status: employee.status } }, as: :json
    end

    assert_response :created
  end

  test 'should show employee' do
    get employee_url(@employee), as: :json
    assert_response :success
  end

  test 'should get tasks for an employee' do
    get tasks_path(@employee, employee: { future: true }), as: :json
    assert_response :success
  end

  test 'should update employee' do
    patch employee_url(@employee),
          params: { employee: { email: @employee.email, name: @employee.name, status: @employee.status } }, as: :json
    assert_response :success
  end

  test 'should destroy employee' do
    assert_difference('Employee.count', -1) do
      delete employee_url(@employee), as: :json
    end

    assert_response :no_content
  end
end
