class Post < ApplicationRecord
  has_many :comments, dependent: :delete_all
  belongs_to :user
  validates :title, presence: true
  validates :content, presence: true
end
