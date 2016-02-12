class Employee
  attr_reader :name, :email, :phone, :salary, :review
  def initialize(name, email, phone, salary)
    @name = name
    @email = email
    @phone = phone
    @salary = salary

  end

  def add_employee_review(review)
    @review = review
  end
end
