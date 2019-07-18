#require_relative "manager.rb"

class Employee

  attr_reader :name, :title, :salary, :boss

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    if self.is_a?(Manager)
      (all_subordinates.sum { |x| x.salary}) * multiplier
    else 
     self.salary * multiplier
    end
  end


end