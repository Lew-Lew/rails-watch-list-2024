class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :comment, length: { minimum: 10 }
  validates :movie_id, uniqueness: { scope: :list_id, message: "Ce film est déjà dans cette liste" }
end
