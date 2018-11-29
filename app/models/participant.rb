class Participant < ApplicationRecord
  has_and_belongs_to_many :groups
  has_many :scores
  
  validates :name, :last_name, :gender, presence: true
end
