require 'spec_helper'

describe Championship do
  it { should validate_presence_of :name }
  it { should validate_presence_of :started_on }
  it { should validate_presence_of :ended_on }

  describe "uniqueness" do
    before(:each) { Championship.make! }
    it {should validate_uniqueness_of :name }
  end

  it "to_s should be equal name" do
    subject.name = "World Cup"
    subject.to_s.should == "World Cup"
  end

  it "ended_on should not be equal to started_on" do
    subject.started_on = Date.tomorrow
    subject.ended_on = Date.tomorrow

    subject.should have(1).errors_on(:ended_on)
  end

  it "ended_on should not be less than to started_on" do
    subject.started_on = Date.today.next_month
    subject.ended_on = Date.yesterday.next_month

    subject.should have(1).errors_on(:ended_on)
  end

  it "ended_on should not be equal to today" do
    subject.started_on = Date.yesterday
    subject.ended_on = Date.today

    subject.should have(1).errors_on(:ended_on)
  end

  it "ended_on should not be less than to today" do
    subject.started_on = Date.yesterday - 1.month
    subject.ended_on = Date.yesterday

    subject.should have(1).errors_on(:ended_on)
  end
end
