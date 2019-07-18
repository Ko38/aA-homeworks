require_relative "employee.rb"

class Manager < Employee

  

  def initialize(employees, name, title, salary, boss)
    super(name, title, salary, boss)
    @employees = employees

  end

  def all_subordinates
    subordinates = @employees.dup
    subordinates.each do |employee|
      if employee.is_a?(Manager)
        subordinates += employee.all_subordinates
      end
    end
    subordinates
  end

end

e1 = Employee.new("e1", "janitor", 5000, "boss")
e2 = Employee.new("e2", "janitor", 5000, "boss")
e3 = Employee.new("e3", "janitor", 5000, "boss")

m1 = Manager.new([e1,e2], "Alvin", "product manager", 7000, "CEO")
m2 = Manager.new([m1,e3], "Donny", "Senior manager", 9000, "CEO")

p m2.all_subordinates.map { |ele| ele.name}
p m1.all_subordinates.map{ |ele| ele.name}

p m2.bonus(2)