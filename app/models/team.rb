class Team < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => {:allow_blank => true}

  def to_s
    name.to_s
  end
end
