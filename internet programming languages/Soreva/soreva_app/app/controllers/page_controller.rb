# frozen_string_literal: true

# Class for PageController
class PageController < ApplicationController
  before_action :auth, only: :competition

  def main; end

  def competition
    competitors_id = current_user.followers.map(&:id)
    competitors_id << current_user.id
    @competitors = User.where(id: competitors_id)
  end

  private

  def auth
    redirect_to new_session_path if current_user.nil?
  end
end
