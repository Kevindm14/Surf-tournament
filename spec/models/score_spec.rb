require 'rails_helper'

RSpec.describe Score, type: :model do
  describe "Relations" do
    it { should belong_to(:judge)}
    it { should belong_to(:participant)}
    it { should belong_to(:group)}
  end
end