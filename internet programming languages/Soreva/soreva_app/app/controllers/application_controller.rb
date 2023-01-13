# frozen_string_literal: true

# Class for ApplicationController
class ApplicationController < ActionController::Base
  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find_by(id: session[:current_user_id]) if session[:current_user_id]
  end

  def log_out
    session.delete(:current_user_id)
  end
end
