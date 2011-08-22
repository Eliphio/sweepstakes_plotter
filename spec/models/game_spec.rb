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
end
