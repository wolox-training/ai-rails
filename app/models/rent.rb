class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :from, :to, :user, :book, presence: true

  def display_name
    "#{book.title} / #{user.display_name}"
  end
end
