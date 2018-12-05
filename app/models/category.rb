class Category < ApplicationRecord
  has_many :tournament_categories
  has_many :tournaments, through: :tournament_categories
  validates :name, presence: true
end
