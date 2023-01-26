class Calculator

    def add(num1 , num2)   
        return num1+num2      
    end

    def subtract(num1 , num2)   
        return num1-num2      
    end

    def multiply(num1 , num2)   
        return num1*num2      
    end

end

Calculator_instance=Calculator.new
puts Calculator_instance.add(2,3)
puts Calculator_instance.subtract(3,2)
puts Calculator_instance.multiply(2,3)

