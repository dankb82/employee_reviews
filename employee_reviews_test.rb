require 'minitest/autorun'
require 'minitest/pride'

#Note: This line is going to fail first.
require './department'



class EmployeeReviews < Minitest::Test

  def test_classes_exist
    assert Department
    assert Employee
  end

  def test_can_create_new_department
    a = Department.new("Marketing")
    assert a
    assert_equal "Marketing", a.name
  end

  def test_can_create_new_employee
    new_employee = Employee.new("Dan", "d@mail.com", "914", 50000.00)
    assert new_employee
  end

  def test_can_add_employee_to_a_department
    a = Department.new("Marketing")
    new_employee = Employee.new("Dan", "d@mail.com", "914", 50000.00)
    a.add_employee(new_employee)
    assert_equal new_employee, a.staff[0]
  end
  def test_can_get_employee_name
    new_employee = Employee.new("Dan", "d@mail.com", "914", 50000.00)
    assert_equal new_employee.name, "Dan"
  end

  def test_can_get_employee_salary
    new_employee = Employee.new("Dan", "d@mail.com", "914", 50000.00)
    assert_equal new_employee.salary, 50000.00
  end

  def test_can_get_a_department_name
    a = Department.new("Marketing")
    assert_equal a.name, "Marketing"
  end










end
