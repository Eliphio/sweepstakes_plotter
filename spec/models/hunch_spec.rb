require 'spec_helper'

describe Hunch do
  it { should belong_to :bet }
  it { should belong_to :game }

  it { should validate_presence_of :bet }
  it { should validate_presence_of :game }
  it { should validate_presence_of :team_1_hunch }
  it { should validate_presence_of :team_2_hunch }
  it { should validate_numericality_of :team_1_hunch }
  it { should validate_numericality_of :team_2_hunch }

  describe "validate uniqueness" do
    before(:each) { Hunch.make! }
    it { should validate_uniqueness_of(:game_id).scoped_to(:bet_id  )}
  end
end
