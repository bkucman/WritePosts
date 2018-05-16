class News < ApplicationRecord
	belongs_to :user
	has_one_attached :image
	
  	validates :name, length: { minimum: 5 , message: "Co najmniej 5 znaki."}

  	validates :desc, length: { minimum: 10 , message: "Co najmniej 10 znaków."}
end
