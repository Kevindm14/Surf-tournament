class Group < ApplicationRecord
  has_and_belongs_to_many :participants
  belongs_to :category
  has_many :scores

  validates :name, presence: true
end
