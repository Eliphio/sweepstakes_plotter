class Bet < ActiveRecord::Base
  belongs_to :round
  belongs_to :user
  has_many :hunches

  validates :round, :user, :status, :presence => true
  validates :round_id, :uniqueness => {:scope => :user_id, :allow_blank => true}

  after_create :create_hunches

  has_enumeration_for :status, :with => Bet::Status, :create_helpers => true

  delegate :championship, :to => :round, :allow_blank => true

  scope :of_round, lambda{|round_id| joins(:round).where(:round => {:id => round_id})}
  scope :of_user, lambda{|user_id| joins(:user).where(:user => {:id => user_id})}
  scope :hunchable, lambda { joins(:round => :games).where(:round => {:games => ({:game_day.gteq => Date.today}|{:game_day => Date.today, :game_time.gteq => 10.minutes.ago})}) }

protected
  def create_hunches
    round.games.each do |game|
      hunches.create :game => game
    end
  end
end
