require 'rails_helper'

describe CategoriesParticipant, type: :model do
  describe "Validations" do
    it { should belong_to(:participant)}
    it { should belong_to(:category)}
  end
end