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




end
