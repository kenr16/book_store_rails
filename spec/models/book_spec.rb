require 'rails_helper'

RSpec.describe Book do
  it { should validate_presence_of :title }
  it { should validate_presence_of :description }
  it { should validate_presence_of :length }
  it { should validate_presence_of :stock }
  it { should validate_presence_of :price }
end
