require 'spec_helper'

describe Team do
  it { should validate_presence_of :name }
  describe "validate uniqueness" do
    before(:each) { Team.make! }
    it { should validate_uniqueness_of :name }
  end
end
