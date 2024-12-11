class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :user_id, uniqueness: { scope: :book_id, message: "You can only favorite a book once" }
end
