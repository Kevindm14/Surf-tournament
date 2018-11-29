class Tournament < ApplicationRecord
  has_many :categories

  validates :name, :place, :start_date, :final_date, presence: true
end
