class User < ApplicationRecord
    has_many :posts, dependent: :delete_all

    validates :name, presence: true
    validates :email, presence: true
end
