require 'minitest/autorun'
require 'minitest/pride'

#Note: This line is going to fail first.
require './department.rb'



class EmployeeReviews < Minitest::Test

  def test_classes_exist
    assert Department
    assert Employee
  end


end
