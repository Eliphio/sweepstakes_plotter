require 'spec_helper'

describe Round do
  it { should belong_to :championship }
  it { should have_many :games }
  it { should validate_presence_of :championship }
  it { should validate_presence_of :name }

  it 'to_s should be equal name' do
    subject.name = '1st Round'
    subject.to_s.should == '1st Round'
  end
end
