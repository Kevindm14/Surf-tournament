class Score < ApplicationRecord
  belongs_to :participant
  belongs_to :judge
  belongs_to :group
end
