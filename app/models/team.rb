class Team < ActiveRecord::Base
  validates :name, :state, :presence => true
end
