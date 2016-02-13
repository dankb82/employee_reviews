class Employee
  attr_reader :name, :email, :phone, :review, :satisfactory
  attr_accessor :salary

  def initialize(name: nil, email: nil, phone: nil, salary: nil)
    @name = name
    @email = email
    @phone = phone
    @salary = salary
  end

  def add_employee_review(review)
    @review = review
  end

  def employee_performance(boolean)
    @satisfactory = boolean
  end

  def employee_raise(raise_percentage)
    @salary = (@salary * raise_percentage) + @salary
  end
end
