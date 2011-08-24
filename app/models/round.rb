class Round < ActiveRecord::Base
  belongs_to :championship
  has_many :games
  
  validates :championship, :name, :presence => true
  validates :name, :uniqueness => {:scope => :championship_id, :allow_blank => true}

  def to_s
    name.to_s
  end
end
