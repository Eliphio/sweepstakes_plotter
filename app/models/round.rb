class Round < ActiveRecord::Base
  belongs_to :championship
  has_many :games
  
  validates :championship, :name, :presence => true
  validates :name, :uniqueness => {:scope => :championship_id, :allow_blank => true}

  scope :of_championship, lambda { |championship_id| joins(:championship).where(:championship => {:id => championship_id}) }
  scope :distincts, select("DISTINCT(#{quoted_table_name}.*)")
  scope :hunchables, joins(:games).where(:games => ({:game_day.gteq => Date.today}|{:game_day => Date.today, :game_time.gteq => 10.minutes.ago}))

  def hunchable?
    games.any? &:hunchable?
  end

  def to_s
    name.to_s
  end
end
