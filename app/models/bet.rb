class Bet < ActiveRecord::Base
  belongs_to :round
  belongs_to :user

  validates :round, :user, :status, :presence => true
  validates :round_id, :uniqueness => {:scope => :user_id, :allow_blank => true}
end
