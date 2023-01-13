# frozen_string_literal: true

module LcmCalculatorHelper
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
