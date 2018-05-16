class Topic < ApplicationRecord
	belongs_to :user
	has_many :comments

  validates :name, length: { minimum: 3 , message: "Co najmniej 3 znaki."}

  validates :desc, length: { minimum: 5 , message: "Co najmniej 5 znaków."}
end
