class Category < ApplicationRecord
  has_many :tournament_categories
  has_many :tournaments, through: :tournament_categories
  has_many :groups
  has_many :categories_participant
  has_many :participants, through: :categories_participant
  
  validates :name, presence: true

  accepts_nested_attributes_for :participants, reject_if: :all_blank, allow_destroy: true
end