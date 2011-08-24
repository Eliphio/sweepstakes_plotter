require 'spec_helper'

describe Bet do
  it { should belong_to :user }
  it { should belong_to :round }

  it { should validate_presence_of :user }
  it { should validate_presence_of :round }
  it { should validate_presence_of :status }

  describe "validate uniqueness" do
    before(:each) { Bet.make! }
    it { should validate_uniqueness_of(:round_id).scoped_to(:user_id)}
  end
end
