# frozen_string_literal: true

# Class for SessionController
class SessionController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:current_user_id] = user.id
      redirect_to root_path, notice: 'Вы успешно вошли в аккаунт!'
    else
      redirect_to new_session_path, alert: 'Неверный логин или пароль'
    end
  end

  def destroy
    log_out
    redirect_to root_path, notice: 'Вы вышли из аккаунта'
  end
end
