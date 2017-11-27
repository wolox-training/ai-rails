class BookSuggestion < ApplicationRecord
  belongs_to :user
  validates :author, :link, :user, :title, presence: true
end
