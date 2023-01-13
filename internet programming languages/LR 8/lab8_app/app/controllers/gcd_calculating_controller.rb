# frozen_string_literal: true

# Controller for lab8
class GcdCalculatingController < ApplicationController
  def input; end

  def output
    @num1 = params[:number1].to_i
    @num2 = params[:number2].to_i
    @iterations = evklid @num1.abs, @num2.abs
    @gcd = @iterations.last.first
    @lcm = @num1 * @num2 / @gcd if @gcd != 0
  end

  private

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
