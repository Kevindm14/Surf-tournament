require 'rails_helper'

RSpec.describe Category, type: :model do
  it { should belong_to(:tournament)}
  it { should have_many(:groups)}
  it { should validate_presence_of(:name)}
end