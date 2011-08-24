require 'spec_helper'

describe Round do
  it { should belong_to :championship }
  it { should have_many :games }
  it { should validate_presence_of :championship }
  it { should validate_presence_of :name }

  describe "validate uniqueness" do
    before(:each) { Round.make! }
    it { should validate_uniqueness_of(:name).scoped_to(:championship_id)}
  end

  it 'to_s should be equal name' do
    subject.name = '1st Round'
    subject.to_s.should == '1st Round'
  end
end
