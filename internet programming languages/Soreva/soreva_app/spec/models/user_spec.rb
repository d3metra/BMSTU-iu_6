require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'test user' do
    let(:test_user) do
      test_user = User.new(username: 'testuser', email: 'testuser@mail.ru', 
        password: '123456', password_confirmation: '123456')
      test_user.save!
    end

    context 'when valid data' do
      it 'returns success' do
        img = Rails.root.join('spec', 'support', 'assets', 'test_img.jpg')
        user = User.new(username: 'dmitry', email: 'dmitry@mail.ru', 
          password: 'qwerty', password_confirmation: 'qwerty')
        user.avatar.attach(io: File.open(img), filename: 'test_img.jpg')
        expect(user.save).to eq true
      end
    end

    context 'when invalid data' do
      it 'returns error with null' do
        expect { User.create! }.to raise_error(ActiveRecord::RecordInvalid)
      end

      it 'returns error message, null username' do
        img = Rails.root.join('spec', 'support', 'assets', 'test_img.jpg')
        user = User.new(username: nil, email: 'example@mail.ru', 
          password: 'qwerty', password_confirmation: 'qwerty')
        user.avatar.attach(io: File.open(img), filename: 'test_img.jpg')
        user.save
        expect(user.errors[:username][0]).to eq '- введите имя пользователя'
      end

      it 'returns error message, invalid username' do
        img = Rails.root.join('spec', 'support', 'assets', 'test_img.jpg')
        user = User.new(username: 'name !', email: 'example@mail.ru', 
          password: 'qwerty', password_confirmation: 'qwerty')
        user.avatar.attach(io: File.open(img), filename: 'test_img.jpg')
        user.save
        expect(user.errors[:username][0]).to eq '- имя пользователя может содержать только латинские буквы и цифры'
      end

      it 'returns error message, to short username' do
        img = Rails.root.join('spec', 'support', 'assets', 'test_img.jpg')
        user = User.new(username: 'a', email: 'example@mail.ru',
          password: 'qwerty', password_confirmation: 'qwerty')
        user.avatar.attach(io: File.open(img), filename: 'test_img.jpg')
        user.save
        expect(user.errors[:username][0]).to eq '- имя пользователя должно содержать минимум 3 символа'
      end

      it 'returns error message, too long username' do
        img = Rails.root.join('spec', 'support', 'assets', 'test_img.jpg')
        user = User.new(username: ('a' * 20).to_s, email: 'example@mail.ru',
          password: 'qwerty', password_confirmation: 'qwerty')
        user.avatar.attach(io: File.open(img), filename: 'test_img.jpg')
        user.save
        expect(user.errors[:username][0]).to eq '- имя пользователя должно содержать максимум 15 символов'
      end

      it 'returns error message, exist username' do
        test_user

        img = Rails.root.join('spec', 'support', 'assets', 'test_img.jpg')
        user = User.new(username: 'testuser', email: 'example@mail.ru',
          password: 'qwerty', password_confirmation: 'qwerty')
        user.avatar.attach(io: File.open(img), filename: 'test_img.jpg')
        user.save
        expect(user.errors[:username][0]).to eq '- имя пользователя уже занято'
      end

      it 'returns error message, invalid file type' do
        file = Rails.root.join('spec', 'support', 'assets', 'test_file.txt')
        user = User.new(username: 'example', email: 'example@mail.ru',
          password: 'qwerty', password_confirmation: 'qwerty')
        user.avatar.attach(io: File.open(file), filename: 'test_file.txt')
        user.save
        expect(user.errors[:avatar][0]).to eq '- файл формата png или jpeg'
      end

      it 'returns error message, null email' do
        img = Rails.root.join('spec', 'support', 'assets', 'test_img.jpg')
        user = User.new(username: 'username', email: nil,
          password: 'qwerty', password_confirmation: 'qwerty')
        user.avatar.attach(io: File.open(img), filename: 'test_img.jpg')
        user.save
        expect(user.errors[:email][0]).to eq '- введите адрес электронной почты'
      end

      it 'returns error message, exist email' do
        test_user

        img = Rails.root.join('spec', 'support', 'assets', 'test_img.jpg')
        user = User.new(username: 'username', email: 'testuser@mail.ru',
          password: 'qwerty', password_confirmation: 'qwerty')
        user.avatar.attach(io: File.open(img), filename: 'test_img.jpg')
        user.save
        expect(user.errors[:email][0]).to eq '- адрес электрооный почты уже занят'
      end

      it 'returns error message, too short password' do
        img = Rails.root.join('spec', 'support', 'assets', 'test_img.jpg')
        user = User.new(username: 'username', email: 'example@mail.ru',
          password: '12345', password_confirmation: 'qwerty')
        user.avatar.attach(io: File.open(img), filename: 'test_img.jpg')
        user.save
        expect(user.errors[:password][0]).to eq '- пароль должен содержать минимум 6 символов'
      end

      it 'returns error message, password_confirmation != password' do
        img = Rails.root.join('spec', 'support', 'assets', 'test_img.jpg')
        user = User.new(username: 'username', email: 'example@mail.ru',
          password: 'qwerty', password_confirmation: 'ytrewq')
        user.avatar.attach(io: File.open(img), filename: 'test_img.jpg')
        user.save
        expect(user.errors.full_messages[0]).to eq 'Password confirmation doesn\'t match Password'
      end
    end
  end
end
