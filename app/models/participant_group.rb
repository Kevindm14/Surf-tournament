class ParticipantGroup < ApplicationRecord
  belongs_to :participant
  belongs_to :group
end
