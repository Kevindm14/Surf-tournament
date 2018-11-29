class Judge < ApplicationRecord
  has_many :scores

  validates :name, :last_name, :password, presence: true
  validates :email, presence: true, uniqueness: true
end
