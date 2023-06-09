class Book < ApplicationRecord
  validates :name, presence: true
  validates :pages, presence: true, numericality: true
  validates :author, presence: true
  belongs_to :author
end
