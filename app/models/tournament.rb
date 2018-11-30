class Tournament < ApplicationRecord
  attr_accessor :start_date
  attr_accessor :final_date

  validates :name, :place, :start_date, :final_date, presence: true
  validates_numericality_of :start_date, less_than: :final_date 
  validates_numericality_of :final_date, greater_than: :start_date
  
end
