require 'rails_helper'

RSpec.describe Account do
  it { should validate_presence_of :name }
end
