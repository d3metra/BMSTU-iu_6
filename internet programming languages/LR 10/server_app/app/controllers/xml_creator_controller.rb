# frozen_string_literal: true

# Class for Server-controller
class XmlCreatorController < ApplicationController
  before_action :parse_params, only: :lcm_calculator

  def lcm_calculator
    iterations = evklid @num1.abs, @num2.abs
    gcd = iterations.last.first
    lcm = @num1 * @num2 / gcd if gcd != 0
    result = [@num1, @num2, gcd, lcm, iterations]

    respond_to do |format|
      format.xml { render xml: result.to_xml }
      format.rss { render xml: result.to_xml }
    end
  end

  private

  def parse_params
    @num1 = params[:number1].to_i
    @num2 = params[:number2].to_i
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
