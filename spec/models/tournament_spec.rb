require 'rails_helper'

RSpec.describe Tournament, type: :model do
  it { should have_many(:categories)}
  it { should validate_presence_of(:name)}
  it { should validate_presence_of(:place)}
  it { should validate_presence_of(:start_date)}
  it { should validate_presence_of(:final_date)}
end