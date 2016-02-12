class Employee
  attr_reader :name, :email, :phone, :salary, :review, :satisfactory
  def initialize(name, email, phone, salary)
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

  def employee_raise(raise_amount)
    @salary = (@salary * raise_amount) + @salary
  end
end
