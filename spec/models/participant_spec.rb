require 'rails_helper'

describe Participant, type: :model do
  it { should have_many(:scores)}
  it { should have_and_belong_to_many(:groups) }
  it { should validate_presence_of(:name)}
  it { should validate_presence_of(:last_name)}
  it { should validate_presence_of(:gender)}
end