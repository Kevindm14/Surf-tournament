class Group < ApplicationRecord
  belongs_to :category
  belongs_to :tournament
  has_many :participant_groups, dependent: :destroy
  has_many :participants, through: :participant_groups
  has_many :scores
  accepts_nested_attributes_for :scores, reject_if: :all_blank
  accepts_nested_attributes_for :participants, reject_if: :all_blank, allow_destroy: true
end
