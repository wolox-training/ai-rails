class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :from, presence: true
  validates :to, presence: true
  validates :user, presence: true
  validates :book, presence: true
end
