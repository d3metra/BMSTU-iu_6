# frozen_string_literal: true

# Class for UsersController
class UsersController < ApplicationController
  before_action :set_user
  skip_before_action :set_user, only: %i[new create index search show_updres update_results]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      Result.create(user_id: @user.id)
      redirect_to root_path, notice: 'Вы успешно зарегистрированы'
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def index
    @users = User.order(:username)
  end

  def search
    if params[:username_search].present?
      @find_users = []
      User.all.each { |user| @find_users.push(user) if user.username.include?(params[:username_search]) }
    else
      @find_users = User.order(:username)
    end
  end

  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to user_url(@user), notice: 'Данные успешно изменены'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    log_out if current_user == @user
    @user.destroy
    redirect_to root_path, notice: 'Аккаунт успешно удалён'
  end

  def show_updres; end

  def update_results
    current_user.result.update(
      bench_press_max: params[:bench_press_max],
      bench_press: params[:bench_press],
      pull_ups_max: params[:pull_ups_max],
      pull_ups: params[:pull_ups],
      push_ups_bars_max: params[:push_ups_bars_max],
      push_ups_bars: params[:push_ups_bars],
      run_100m: params[:run_100m],
      barbell_squat: params[:barbell_squat]
    )
    redirect_to user_path(current_user.id)
  end

  def follow
    current_user.send_follow_request_to(@user)
    redirect_to user_path(@user.id)
  end

  def unfollow
    make_it_an_unfriend_request

    current_user.unfollow(@user)
    redirect_to user_path(@user.id)
  end

  def accept
    current_user.accept_follow_request_of(@user)
    make_it_an_friend_request
    redirect_to user_path(current_user.id)
  end

  def decline
    current_user.decline_follow_request_of(@user)
    redirect_to user_path(current_user.id)
  end

  def cancel
    current_user.remove_follow_request_for(@user)
    redirect_to user_path(@user.id)
  end

  private

  def make_it_an_friend_request
    current_user.send_follow_request_to(@user)
    @user.accept_follow_request_of(current_user)
  end

  def make_it_an_unfriend_request
    @user.unfollow(current_user) if @user.mutual_following_with?(current_user)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :avatar, :email, :password, :password_confirmation, :old_password)
  end
end
