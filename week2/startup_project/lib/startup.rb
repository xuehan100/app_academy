require "employee"

class Startup
    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def name 
        @name
    end

    def funding
        @funding
    end

    def salaries
        @salaries
    end

    def employees
        @employees
    end

    def valid_title?(tt) 
        salaries.has_key?(tt)
    end

    def >(company)
        if self.funding > company.funding
            return true
        else 
            return false
        end
    end

    #pay attention to this method
    def hire(employee_name, title) 
        raise "There is no such title" if !valid_title?(title)
        employees << Employee.new(employee_name, title)
    end

    def size
        employees.length
    end

    def pay_employee(member)
        salary = self.salaries[member.title]
        raise "not enough funding" if salary > @funding
        @funding -= salary
        member.pay(salary)
    end

    def payday
        @employees.each {|ele| pay_employee(ele)}
    end

    def average_salary
        sum = 0
        @employees.each {|ele| sum += @salaries[ele.title]}
        sum / @employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(another_startup)
        @funding += another_startup.funding
        salary_map = another_startup.salaries
        salary_map.each do |key, val|
            if !@salaries.has_key?(key)
                @salaries[key] = val
            end
        end
        
        @employees += another_startup.employees
        another_startup.close
    end



end
