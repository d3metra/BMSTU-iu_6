require 'rails_helper'

RSpec.describe Exercise, type: :model do
  describe 'test exercise' do
    let(:test_exercise) do
      img = Rails.root.join('spec', 'support', 'assets', 'test_img.jpg')
      test_exercise = Exercise.new(name: 'testexercise', exercise_type: 'Грудные мышцы', description: ('description' * 75).to_s, 
        technique: ('technique' * 75).to_s)
      test_exercise.image.attach(io: File.open(img), filename: 'test_img.jpg')
      test_exercise.save!
    end

    context 'when valid data' do
      it 'returns success' do
        img = Rails.root.join('spec', 'support', 'assets', 'test_img.jpg')
        exercise = Exercise.new(name: 'exercise', exercise_type: 'Грудные мышцы', description: ('description' * 75).to_s, 
          technique: ('technique' * 75).to_s)
        exercise.image.attach(io: File.open(img), filename: 'test_img.jpg')
        expect(exercise.save).to eq true
      end
    end

    context 'when ivalid data' do
      it 'returns error message with null' do
        expect { Exercise.create! }.to raise_error(ActiveRecord::RecordInvalid)
      end

      it 'returns error message, null file' do
        exercise = Exercise.new(name: 'exercise', exercise_type: 'Грудные мышцы', description: ('description' * 75).to_s, 
          technique: ('technique' * 75).to_s)
          exercise.save
          expect(exercise.errors[:image][0]).to eq '- прикрепите фото'
      end

      it 'returns error message, wrong file type' do
        file = Rails.root.join('spec', 'support', 'assets', 'test_file.txt')
        exercise = Exercise.new(name: 'exercise', exercise_type: 'Грудные мышцы', description: ('description' * 75).to_s, 
          technique: ('technique' * 75).to_s)
        exercise.image.attach(io: File.open(file), filename: 'test_file.txt')
        exercise.save
        expect(exercise.errors[:image][0]).to eq '- файл формата png или jpeg'
      end

      it 'returns error message, null name' do
        img = Rails.root.join('spec', 'support', 'assets', 'test_img.jpg')
        exercise = Exercise.new(name: nil, exercise_type: 'Грудные мышцы', description: ('description' * 75).to_s, 
          technique: ('technique' * 75).to_s)
        exercise.image.attach(io: File.open(img), filename: 'test_img.jpg')
        exercise.save
        expect(exercise.errors[:name][0]).to eq '- введите название упражнения'
      end

      it 'returns error message, exist exercise' do
        test_exercise

        img = Rails.root.join('spec', 'support', 'assets', 'test_img.jpg')
        exercise = Exercise.new(name: 'testexercise', exercise_type: 'Грудные мышцы', description: ('description' * 75).to_s, 
          technique: ('technique' * 75).to_s)
        exercise.image.attach(io: File.open(img), filename: 'test_img.jpg')
        exercise.save
        expect(exercise.errors[:name][0]).to eq '- данное упражнение уже имеется в каталоге'
      end

      it 'returns error message, null description' do
        img = Rails.root.join('spec', 'support', 'assets', 'test_img.jpg')
        exercise = Exercise.new(name: 'exercise', exercise_type: 'Грудные мышцы', description: nil, 
          technique: ('technique' * 75).to_s)
        exercise.image.attach(io: File.open(img), filename: 'test_img.jpg')
        exercise.save
        expect(exercise.errors[:description][0]).to eq '- введите описание упражнения'
      end

      it 'returns error message, null technique' do
        img = Rails.root.join('spec', 'support', 'assets', 'test_img.jpg')
        exercise = Exercise.new(name: 'testexercise', exercise_type: 'Грудные мышцы', description: ('description' * 75).to_s, 
          technique: nil)
        exercise.image.attach(io: File.open(img), filename: 'test_img.jpg')
        exercise.save
        expect(exercise.errors[:technique][0]).to eq '- опишите технику выполнения упражнения'
      end
    end
  end
end
