class Bet < ActiveRecord::Base
  belongs_to :round
  belongs_to :user
  has_many :hunches

  validates :round, :user, :status, :presence => true
  validates :round_id, :uniqueness => {:scope => :user_id, :allow_blank => true}

  has_enumeration_for :status, :with => Bet::Status, :create_helper => true
end
