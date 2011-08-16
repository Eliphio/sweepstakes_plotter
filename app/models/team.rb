class Team < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => {:allow_blank => true}
end
