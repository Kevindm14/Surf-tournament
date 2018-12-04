class Participant < ApplicationRecord
  has_and_belongs_to_many :categories

  accepts_nested_attributes_for :categories, reject_if: :all_blank, allow_destroy: true
end
