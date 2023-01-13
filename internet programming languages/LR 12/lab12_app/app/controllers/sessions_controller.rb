# frozen_string_literal: true

# class for SessionConroller
class SessionsController < ApplicationController
  def new; end

  def create_session
    user = User.authenticate(params[:email], params[:password])
    if user.nil?
      flash[:alert] = '- неверный email или пароль.'
    else
      sign_in user
    end
    redirect_to root_path
  end

  def sign_in(user)
    session[:current_user_id] = user.id
  end

  def sign_out
    session[:current_user_id] = nil
  end

  def exit
    sign_out
    redirect_to :root
  end
end
