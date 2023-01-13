module LcmCalculatorHelper
    def lcm_calculator(num1, num2)
        iterations = evklid num1.abs, num2.abs
        gcd = iterations.last.first
        lcm = num1 * num2 / gcd if gcd != 0
    
        [iterations, gcd, lcm]
      end
    
      def evklid(num1, num2, itr = [])
        itr.push([num1, num2])
        if num1 != num2
          if num1 > num2
            evklid num1 - num2, num2, itr
          else
            evklid num1, num2 - num1, itr
          end
        end
        itr
      end
end
