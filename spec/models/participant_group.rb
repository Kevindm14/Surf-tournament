require 'rails_helper'

describe Participant, type: :model do
  describe "Validations" do
    it { should belong_to(:participant)}
    it { should belong_to(:group)}
  end
end