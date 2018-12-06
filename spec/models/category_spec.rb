require 'rails_helper'

describe Category, type: :model do
  describe "Validations" do
    it { should validate_presence_of(:name)}
    it { should have_many(:tournament_categories)}
    it { should have_many(:tournaments).through(:tournament_categories)}
  end
end