class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :omniauthable

  include DeviseTokenAuth::Concerns::User

  has_many :rents, dependent: :destroy
  has_many :booksuggestions, dependent: :destroy
  validates :first_name, :last_name, presence: true
end
