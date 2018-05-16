class News < ApplicationRecord
	belongs_to :user

  validates :name, length: { minimum: 5 , message: "Co najmniej 5 znaki."}

  validates :desc, length: { minimum: 10 , message: "Co najmniej 10 znaków."}
end
