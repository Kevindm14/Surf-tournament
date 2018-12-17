require 'rails_helper'

describe TournamentCategory, type: :model do
  describe "Validations" do
    it { should belong_to(:tournament)}
    it { should belong_to(:category)}
  end
end