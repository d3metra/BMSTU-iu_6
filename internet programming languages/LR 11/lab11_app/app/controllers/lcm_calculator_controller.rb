# frozen_string_literal: true

# Class for controller
class LcmCalculatorController < ApplicationController
  before_action :validates, only: :show
  before_action :parse_params, only: :show
  def input; end

  def show
    input = "#{@num1},#{@num2}"
    record = Result.find_by(input: input)
    if record
      @result = [s_to_a(record.iterations), record.gcd, record.lcm]
    else
      @result = helpers.lcm_calculator(@num1, @num2)
      write_to_db(input, @result)
    end
    parse_result(@result)
  end

  def xml
    results = Result.all.map do |result|
      { input: result.input, iterations: result.iterations, gcd: result.gcd, lcm: result.lcm }
    end
    render xml: results
  end

  private

  def validates
    number1 = params[:number1]
    number2 = params[:number2]
    return if number1&.match(/-?[1-9]+/) && number2&.match(/-?[1-9]+/)

    flash[:alert] = '- поле не должно быть пустым или содержать 0'
    redirect_to root_path
  end

  def parse_params
    @num1 = params[:number1].to_i
    @num2 = params[:number2].to_i
  end

  def write_to_db(input, result)
    Result.create!(input: input, iterations: result[0], gcd: result[1], lcm: result[2])
  end

  def parse_result(result)
    @iterations = result[0]
    @gcd = result[1]
    @lcm = result[2]
  end

  def s_to_a(string)
    array = string.split('], ')
    array.map! { |s| s.delete '[,]' }
    array.map! { |s| s.split ' ' }
    array.map! { |n, m| [n.to_i, m.to_i] }
  end
end
