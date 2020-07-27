class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  before_action :authenticate_user!

  validates :introduction, length: {maximum: 50}
  validates :name, length: {minimum: 2}, length: {maximum: 20}


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :books, dependent: :destroy
  attachment :profile_image
end
