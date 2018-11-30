require 'rails_helper'

RSpec.describe Tournament, type: :model do 
  it { should validate_presence_of(:name)}
  it { should validate_presence_of(:place)}
  it { should validate_presence_of(:start_date)}
  it { should validate_presence_of(:final_date)}
  it { should validate_numericality_of(:start_date).is_less_than(:final_date)}
  it { should validate_numericality_of(:final_date).is_greater_than(:start_date)}
end