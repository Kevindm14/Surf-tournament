class Category < ApplicationRecord
  has_many :tournament_categories
  has_many :tournaments, through: :tournament_categories
  has_many :groups
  has_and_belongs_to_many :participants

  validates :name, presence: true
  validates_uniqueness_of :name, scope: :tournament_id
end