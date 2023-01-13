# frozen_string_literal: true

# Class for LcmCalculator
class LcmCalculatorController < ApplicationController
  before_action :check_user, only: :show
  before_action :validates, only: :show
  def input; end

  def show
    @num1 = params[:number1].to_i
    @num2 = params[:number2].to_i
    @iterations = helpers.evklid @num1.abs, @num2.abs
    @gcd = @iterations.last.first
    @lcm = @num1 * @num2 / @gcd if @gcd != 0
  end

  private

  def check_user
    redirect_to new_session_path if session[:current_user_id].nil?
  end

  def validates
    number1 = params[:number1]
    number2 = params[:number2]
    return if number1&.match(/-?[1-9]+/) && number2&.match(/-?[1-9]+/)

    flash[:alert] = '- поле не должно быть пустым или содержать 0'
    redirect_to input_path
  end
end
