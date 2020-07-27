class Book < ApplicationRecord
	before_action :authenticate_user!

	validates :title, presence: true
	validates :body, presence: true
	validates :body, length: {maximum: 200}

	belongs_to :user
end
