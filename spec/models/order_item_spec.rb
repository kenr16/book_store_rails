require 'rails_helper'

RSpec.describe OrderItem do
  it { should validate_presence_of :quantity }
end
