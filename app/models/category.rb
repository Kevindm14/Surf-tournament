class Category < ApplicationRecord
  belongs_to :tournament
  has_many :groups

  validates :name, presence: true
end
