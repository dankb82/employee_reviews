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
    assert_equal a.name, "Marketing"
  end

  def test_can_create_new_employee
    new_employee = Employee.new("Dan", "d@mail.com", "914", 50000.00)
    assert new_employee
  end

  def test_can_add_employee_to_a_department
    a = Department.new("Marketing")
    new_employee = Employee.new("Dan", "d@mail.com", "914", 50000.00)
    a.add_employee(new_employee)
    assert_equal a.staff[0], new_employee
  end
  def test_can_get_employee_name
    new_employee = Employee.new("Dan", "d@mail.com", "914", 50000.00)
    assert_equal "Dan", new_employee.name
  end

  def test_can_get_employee_salary
    new_employee = Employee.new("Dan", "d@mail.com", "914", 50000.00)
    assert_equal 50000.00, new_employee.salary
  end

  def test_can_get_a_department_name
    a = Department.new("Marketing")
    assert_equal "Marketing", a.name
  end

  def test_total_department_salary
    a = Department.new("Marketing")
    new_employee = Employee.new("Dan", "d@mail.com", "914", 50000.00)
    old_employee = Employee.new("Ann", "ann@mail.com", "919", 4000.00)
    assert a.add_employee(new_employee)
    assert a.add_employee(old_employee)
    assert_equal 54000.00, a.department_salary
  end

  def test_add_employee_review
    employee_review = "Xavier is a huge asset to SciMed and is a pleasure to
                       work with. He quickly knocks out tasks assigned to him,
                       implements code that rarely needs to be revisited, and
                       is always willing to help others despite his heavy
                       workload. When Xavier leaves on vacation, everyone
                       wishes he didn't have to go."
    xavier = Employee.new("Xavier", "ProfX@marvel.com", "911", 50000.00)
    assert xavier.add_employee_review(employee_review)
  end
  def test_employee_performance
    new_employee = Employee.new("Dan", "d@mail.com", "914", 50000.00)
    old_employee = Employee.new("Ann", "ann@mail.com", "919", 4000.00)
    new_employee.employee_performance(true)
    old_employee.employee_performance(false)
    assert new_employee.satisfactory
    refute old_employee.satisfactory
  end
end
