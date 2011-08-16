require 'spec_helper'

describe Team do
  it { should validate_presence_of :name }
  describe "validate uniqueness" do
    before(:each) { Team.make! }
    it { should validate_uniqueness_of :name }
  end

  it 'to_s should return name' do
    subject.name = 'Bilbao Viscaya F. C.'
    subject.to_s.should == 'Bilbao Viscaya F. C.'
  end
end
