require './employee'
require 'byebug'
class Department
  attr_reader :name, :staff, :review
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
   sum
  end

  def add_employee_review(review)
    @review = review
  end

  def department_raise(raise_amount)
    raise_eligible = []
    @staff.each do |e|
      if e.satisfactory
        raise_eligible << e
      end
    end
    employee_amount = raise_amount / raise_eligible.length
    raise_eligible.each do |r|
      # byebug
      r.salary = r.salary + employee_amount
    end
  end


end
