class User < ApplicationRecord
    followability

    has_one :result

    has_one_attached :avatar

    has_secure_password

    validates_presence_of :username, message: '- введите имя пользователя'
    validates_each :username do |record, attr, value|
        record.errors.add(attr, message: '- имя пользователя может содержать только латинские буквы и цифры') unless value =~ /^[A-z0-9]+$/ 
    end
    validates_length_of :username, minimum: 3, message: '- имя пользователя должно содержать минимум 3 символа'
    validates_length_of :username, maximum: 15, message: '- имя пользователя должно содержать максимум 15 символов'
    validates_uniqueness_of :username, message: '- имя пользователя уже занято'

    validates :avatar, content_type: { in: ['image/png', 'image/jpeg'], message: '- файл формата png или jpeg' }

    validates_presence_of :email, message: '- введите адрес электронной почты'
    validates_uniqueness_of :email, message: '- адрес электрооный почты уже занят'
    
    
    validates_presence_of :password, message: '- введите пароль'
    validates_confirmation_of :password, message: '- пароли должны совпадать'
    validates_length_of :password, minimum: 6, message: '- пароль должен содержать минимум 6 символов'

    validate :check_old_password, on: :update
    
    enum access_level: [:basic, :admin]
    
    attr_accessor :old_password

    def thumbnail
        self.avatar.variant(resize_to_fill: [50, 50]).processed
    end

    def ava
        self.avatar.variant(resize_to_fill: [350, 350]).processed
    end

    def preview
        self.avatar.variant(resize_to_fill: [100, 100]).processed
    end

    def check_old_password
        return if BCrypt::Password.new(password_digest_was).is_password?(old_password)
        
        errors.add :old_password, 'Неверный пароль'
    end

    def unfollow(user)
        followerable_relationships.where(followable_id: user.id).destroy_all
    end
end
