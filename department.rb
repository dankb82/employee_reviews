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

  def department_salary
   sum = 0
   @staff.each {|a| sum += a.salary}
   return sum
   
 end

end
