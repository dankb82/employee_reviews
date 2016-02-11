require './employee'

class Department
  attr_reader :name, :staff
  def initialize(department_name)
    @name = department_name
    @staff = []
  end

  def add_employee(new_employee)
    @staff << new_employee
  end
end
