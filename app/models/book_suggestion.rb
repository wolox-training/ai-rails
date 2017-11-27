class BookSuggestion < ApplicationRecord
  belongs_to :user, optional: true
  validates :author, :link, :title, presence: true
end
