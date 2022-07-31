class Books < ApplicationRecord
    validates :title, presence: true, length: { minimum: 6, maximum: 100 }
    validates :description, presence: true, length: { minimum: 10, maximum: 300 }
    validates :author, presence: true, length: { minimum: 6, maximum: 100 }
    validates :book_count, presence: true, length: { minimum: 1, maximum: 2}
end
