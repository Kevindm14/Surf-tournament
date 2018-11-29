require 'rails_helper'

RSpec.describe Judge, type: :model do
  it { should have_many(:scores)}
  it { should validate_presence_of(:name)}  
  it { should validate_presence_of(:last_name)}
  it { should validate_presence_of(:email)}
  it { should validate_uniqueness_of(:email)}
  it { should validate_presence_of(:password)}
end