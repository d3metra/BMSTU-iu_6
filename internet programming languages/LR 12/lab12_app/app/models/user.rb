# frozen_string_literal: true

class User < ApplicationRecord
  validates :username, :email, :password_digest, presence: {
    message: '- поле должнo быть заполнены'
  }

  has_secure_password

  def has_password?(submitted_password)
    password_digest == submitted_password
  end

  def self.authenticate(email, submitted_password)
    email
    user = find_by(email:)
    return nil  if user.nil?
    return user if user.has_password?(submitted_password)
  end
end
