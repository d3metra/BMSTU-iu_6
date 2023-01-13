class Exercise < ApplicationRecord
    has_one_attached :image

    validates :image, attached: { message: '- прикрепите фото'}, content_type: { in: ['image/png', 'image/jpeg'], message: '- файл формата png или jpeg' }

    validates_presence_of :name, message: '- введите название упражнения'
    validates_uniqueness_of :name, message: '- данное упражнение уже имеется в каталоге'

    validates_presence_of :description, message: '- введите описание упражнения'

    validates_presence_of :technique, message: '- опишите технику выполнения упражнения'

    def middle
        self.image.variant(resize_to_limit: [600, 630]).processed
    end
end
