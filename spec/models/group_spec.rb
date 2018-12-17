require 'rails_helper'

describe Group, type: :model do
  describe "Validations" do
    it { should belong_to(:category)}
    it { should have_many(:participant_groups)}
    it { should have_many(:participants).through(:participant_groups)}
    it { should accept_nested_attributes_for(:participants)}
  end
end