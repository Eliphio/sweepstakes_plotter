class Round < ActiveRecord::Base
  belongs_to :championship
  has_many :games
  
  validates :championship, :name, :presence => true

  def to_s
    name.to_s
  end
end
