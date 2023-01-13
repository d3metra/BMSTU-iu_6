# frozen_string_literal: true

# Class for ExercisesController
class ExercisesController < ApplicationController
  before_action :set_exercise, only: %i[show edit update destroy]

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.new(exercise_params)
    if @exercise.save
      redirect_to root_path, notice: 'Упражнение успешно добавлено в каталог'
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    if @exercise.update(exercise_params)
      redirect_to exercise_url(@exercise), notice: 'Данные успешно изменены'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @exercise.destroy
    redirect_to root_path, notice: 'Упражнение удалено из каталога'
  end

  private

  def set_exercise
    @exercise = Exercise.find(params[:id])
  end

  def exercise_params
    params.require(:exercise).permit(:image, :name, :exercise_type, :description, :technique)
  end
end
