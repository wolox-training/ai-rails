class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :omniauthable

  include DeviseTokenAuth::Concerns::User

  has_many :rents, dependent: :destroy
  validates :first_name, :last_name, presence: true

  def display_name
    "#{first_name} #{last_name}"
  end
end
