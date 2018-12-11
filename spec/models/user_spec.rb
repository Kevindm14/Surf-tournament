require 'rails_helper'

describe User, type: :model do
  it "Valid factory" do
    expect(build(:user)).to be_valid
  end
  
  context "Validations" do
    before { create(:user)}
    
    context "presence" do
      it { should validate_presence_of(:name)}
      it { should validate_presence_of(:last_name)}
      it { should validate_presence_of(:email)}
      it { should validate_presence_of(:password)}
    end

    context "uniqueness" do
      it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
    end
  end
end