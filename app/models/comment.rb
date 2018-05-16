class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :topic

  validates :desc, length: { minimum: 2 , message: "Co najmniej 2 znaki."}


end
