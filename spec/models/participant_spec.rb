require 'rails_helper'

describe Participant, type: :model do
  describe "Validations" do
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:last_name)}
    it { should validate_presence_of(:gender)}
    it { should have_many(:categories_participant)}
    it { should have_many(:categories).through(:categories_participant)}
    it { should have_many(:participant_groups)}
    it { should have_many(:groups).through(:participant_groups)}
    it { should accept_nested_attributes_for(:categories)}
  end
end