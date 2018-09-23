require 'rails_helper'

RSpec.describe Issue, type: :model do
  it { should validate_presence_of(:github_id) }
  it { should validate_presence_of(:number) }
  it { should validate_presence_of(:url) }
end
