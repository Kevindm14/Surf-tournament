class Participant < ApplicationRecord
  has_many :categories_participant
  has_many :categories, through: :categories_participant
  has_many :participant_groups
  has_many :groups, through: :participant_groups
  has_many :scores

  accepts_nested_attributes_for :categories, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :scores, reject_if: :all_blank
  validates :name, :last_name, :gender, presence: true

  validates :categories, presence:{  message:  "You can not create participants without categories" }
end
