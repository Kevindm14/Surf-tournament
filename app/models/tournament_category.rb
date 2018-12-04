class TournamentCategory < ApplicationRecord
  belongs_to :tournament
  belongs_to :category

  validates_uniqueness_of :category_id, scope: :tournament_id
end
