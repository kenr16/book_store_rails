require 'rails_helper'

RSpec.describe Order do
  it { should validate_presence_of :status }
  it { should validate_presence_of :total_price }
end
