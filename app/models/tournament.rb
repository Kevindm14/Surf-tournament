class Tournament < ApplicationRecord
  has_many :tournament_categories
  has_many :categories, through: :tournament_categories
  accepts_nested_attributes_for :tournament_categories, reject_if: :all_blank, allow_destroy: true
  validates :name, :place, :start_date, :final_date, presence: true
  validate :validate_date?
  
  private

  def validate_date?
    if start_date.to_s >= final_date.to_s
      errors.add(:start_date, "Must be less than the final date")
    end
  end
end
