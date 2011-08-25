require 'spec_helper'

describe Game do
  it { should belong_to :round }
  it { should belong_to :team_1 }
  it { should belong_to :team_2 }

  it { should validate_presence_of :round }
  it { should validate_presence_of :team_1 }
  it { should validate_presence_of :team_2 }
  it { should validate_presence_of :game_day }
  it { should validate_presence_of :game_time }

  describe "uniqueness" do
    before(:each) { Game.make! }
    it { should validate_uniqueness_of(:team_1_id).scoped_to(:round_id, :team_2_id) }
    it { should validate_uniqueness_of(:team_2_id).scoped_to(:round_id, :team_1_id) }
  end

  it "team_2 should not be equal team_1" do
    subject.team_1 = Team.make!
    subject.team_2 = Team.make!

    subject.should have(1).errors_on(:team_2)

    subject.team_2 = Team.make!(:manchester)
    subject.should have(:no).errors_on(:team_2)
  end

  it "to_s should be equal to the names of the team 1 and team 2" do
    subject.team_1 = team_1 = Team.make!
    subject.team_2 = team_2 = Team.make!(:manchester)
    
    subject.to_s.should == "#{team_1} #{team_2}"
  end

  describe "hunchable?" do
    subject { Game.make! }
    it "hunchable? should be true when the future date" do
      subject.game_day = Date.tomorrow
      subject.game_time = 0.minutes.ago
      subject.hunchable?.should be_true
    end

    it "hunchable? should be true when now" do
      subject.game_day = Date.today
      subject.game_time = 0.minutes.ago
      subject.hunchable?.should be_true
    end

    it "hunchable? should be true when 10 minutes ago" do
      subject.game_day = Date.today
      subject.game_time = 10.minutes.ago
      subject.hunchable?.should be_true
    end

    it "hunchable? should be false when 11 minutes ago" do
      subject.game_day = Date.today
      subject.game_time = 11.minutes.ago
      subject.hunchable?.should be_false
    end

    it "hunchable? should be false when not date or time game defined" do
      subject.game_day = Date.today
      subject.game_time = nil
      subject.hunchable?.should be_false

      subject.game_day = nil
      subject.game_time = 10.minute.since
      subject.hunchable?.should be_false

      subject.game_day = nil
      subject.game_time = nil
      subject.hunchable?.should be_false
    end
  end
end
