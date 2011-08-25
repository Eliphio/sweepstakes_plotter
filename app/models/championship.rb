class Championship < ActiveRecord::Base
  has_many :rounds

  validates :name, :started_on, :ended_on, :presence => true
  validates :name, :uniqueness => {:allow_blank => true}
  validates :started_on, :timeliness => { :type => :date }, :allow_blank => true
  validates :ended_on, :timeliness => { :after => :started_on, :type => :date, :allow_blank => true, :if => :started_on? }
  validates :ended_on, :timeliness => { :after => :today, :type => :date, :allow_blank => true }

  scope :distincts, select("DISTINCT(#{quoted_table_name}.*)")
  scope :hunchables, lambda { joins(:rounds => :games).where(:rounds => {:games => ({:game_day.gteq => Date.today}|{:game_day => Date.today, :game_time.gteq => 10.minutes.ago})}) }

  def hunchable?
    rounds.any? &:hunchable?
  end

  def to_s
    name.to_s
  end
end
