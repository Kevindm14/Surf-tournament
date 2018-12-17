require 'rails_helper'

describe Category, type: :model do
  describe "Validations" do
    it { should validate_presence_of(:name)}
    it { should have_many(:tournament_categories)}
    it { should have_many(:tournaments).through(:tournament_categories)}
    it { should have_many(:groups)}
    it { should have_many(:categories_participant)}
    it { should have_many(:participants).through(:categories_participant)}
    it { should accept_nested_attributes_for(:participants)}
  end
end