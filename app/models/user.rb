class User < ApplicationRecord
    has_many :posts, dependent: :delete_all

    validates :name, presence: true
    validates :email, presence: true
    validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Invalid email address"
end
