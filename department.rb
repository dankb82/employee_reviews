require './employee'

class Department
  attr_reader :name
  def initialize(department_name)
    @name = department_name
  end
end
