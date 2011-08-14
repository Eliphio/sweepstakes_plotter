require 'spec_helper'

describe User do
  it { should validate_presence_of :nickname }
  
  context "validate uniqueness of nickname" do
    before(:each) { User.make! }
    it { should validate_uniqueness_of :nickname }
  end
end
