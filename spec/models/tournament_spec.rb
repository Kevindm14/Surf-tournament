require 'rails_helper'

describe Tournament, type: :model do
  describe "Validations" do
    let(:date) { create(:tournament)}

    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:place)}
    it { should validate_presence_of(:start_date)}
    it { should validate_presence_of(:final_date)}
    it { should accept_nested_attributes_for(:tournament_categories)}
    it { should have_many(:tournament_categories)}
    it { should have_many(:categories).through(:tournament_categories)}
    
    it "When start date is greater than final date" do
      expect(date.final_date).to be > date.start_date
    end
    
    it "When start date is less than final date" do
      expect(date.final_date).to be > date.start_date
    end
  end
end