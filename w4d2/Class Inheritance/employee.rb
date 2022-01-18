class Employee
   
    attr_reader :name, :title, :salary, :boss

    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end

    def bonus(multiplier)
        self.salary * multiplier
    end
end

class Manager < Employee

    def initialize(name, title, salary, boss)
        super
        @employees = []
    end

    def bonus(multiplier)
        self.employees_salary * multiplier
    end

    def employees_salary
        total = 0
        @employees.each do |employee|
            if employee.is_a?(Manager)
                total += employee.salary + employee.employees_salary
            else
                total += employee.salary
            end
        end
        total
    end

    def add_employee(employee)
        @employees << employee
    end

end

ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
david = Employee.new("David", "TA", 10000, darren)
shawna = Employee.new("Shawna", "TA", 12000, darren)

ned.add_employee(darren)
darren.add_employee(david)
darren.add_employee(shawna)

p ned.bonus(5)    # 500 000
p darren.bonus(4) # 88 000
p david.bonus(3)  # 30 000

