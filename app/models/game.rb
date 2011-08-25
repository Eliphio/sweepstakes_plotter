class Game < ActiveRecord::Base
  belongs_to :round
  belongs_to :team_1, :class_name => "Team", :foreign_key => :team_1_id
  belongs_to :team_2, :class_name => "Team", :foreign_key => :team_2_id

  validates :round, :team_1, :team_2, :game_day, :game_time, :presence => true
  validates :team_1_id, :uniqueness => { :scope => [:round_id, :team_2_id], :allow_blank => true }
  validates :team_2_id, :uniqueness => { :scope => [:round_id, :team_1_id], :allow_blank => true }

  validate  :teams_of_round_should_not_be_equal

  def to_s
    "#{team_1} #{team_2}"
  end

  def hunchable?
    raise unless game_day && game_time
    DateTime.parse("#{game_day} #{game_time.strftime "%H:%M"}") > 11.minutes.ago
  rescue
    false
  end
protected
  def teams_of_round_should_not_be_equal
    errors.add :team_2, :not_equal if team_1 && team_2 && team_1 == team_2 
  end
end
