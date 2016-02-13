require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'
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
    new_employee = Employee.new(name: "Dan", email: "d@mail.com", phone: "914", salary: 50000.00)
    assert new_employee
  end

  def test_can_add_employee_to_a_department
    a = Department.new("Marketing")
    new_employee = Employee.new(name: "Dan", email: "d@mail.com", phone: "914", salary: 50000.00)
    a.add_employee(new_employee)
    assert_equal a.staff[0], new_employee
  end

  def test_can_get_employee_name
    new_employee = Employee.new(name: "Dan", email: "d@mail.com", phone: "914", salary: 50000.00)
    assert_equal "Dan", new_employee.name
  end

  def test_can_get_employee_salary
    new_employee = Employee.new(name: "Dan", email: "d@mail.com", phone: "914", salary: 50000.00)
    assert_equal 50000.00, new_employee.salary
  end

  def test_can_get_a_department_name
    a = Department.new("Marketing")
    assert_equal "Marketing", a.name
  end

  def test_total_department_salary
    a = Department.new("Marketing")
    new_employee = Employee.new(name: "Dan", email: "d@mail.com", phone: "914", salary: 50000.00)
    old_employee = Employee.new(name: "Ann", email: "ann@mail.com", phone: "919", salary: 4000.00)
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
    xavier = Employee.new(name: "Xavier", email: "ProfX@marvel.com", phone: "911", salary: 70000.00)
    assert xavier.add_employee_review(employee_review)
  end

  def test_employee_performance
    new_employee = Employee.new(name: "Dan", email: "d@mail.com", phone: "914", salary: 50000.00)
    old_employee = Employee.new(name: "Ann", email: "ann@mail.com", phone: "919", salary: 4000.00)
    new_employee.employee_performance(true)
    old_employee.employee_performance(false)
    assert new_employee.satisfactory
    refute old_employee.satisfactory
  end

  def test_give_employee_raise
    new_employee = Employee.new(name: "Dan", email: "d@mail.com", phone: "914", salary: 50000.00)
    assert_equal  54000, new_employee.employee_raise(0.08)
  end

  def test_department_raises_based_on_criteria
    a = Department.new("Marketing")
    xavier = Employee.new(name: "Xavier", email: "ProfX@marvel.com", phone: "911", salary: 70000.00)
    new_employee = Employee.new(name: "Dan", email: "d@mail.com", phone: "914", salary: 50000.00)
    old_employee = Employee.new(name: "Ann", email: "ann@mail.com", phone: "919", salary: 40000.00)
    a.add_employee(xavier)
    a.add_employee(new_employee)
    a.add_employee(old_employee)
    xavier.employee_performance(true)
    new_employee.employee_performance(true)
    old_employee.employee_performance(true)
    a.department_raise(14000.00) {|e| e.satisfactory == true && e.salary < 60000.00}
    byebug
    assert_equal 70000.00, xavier.salary
    assert_equal 57000.00, new_employee.salary
    assert_equal 47000.00, old_employee.salary
  end
end
