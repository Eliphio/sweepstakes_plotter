class Hunch < ActiveRecord::Base
  belongs_to :bet
  belongs_to :game

  validates :bet, :game, :team_1_hunch, :team_2_hunch, :presence => true
  validates :game_id, :uniqueness => {:allow_blank => true, :scope => :bet_id}
  validates :team_1_hunch, :team_2_hunch, :numericality => {:allow_blank => true, :only_integer => true, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 99}
end
