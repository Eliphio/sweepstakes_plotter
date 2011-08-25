class Championship < ActiveRecord::Base
  validates :name, :started_on, :ended_on, :presence => true
  validates :name, :uniqueness => {:allow_blank => true}
  validates :started_on, :timeliness => { :type => :date }, :allow_blank => true
  validates :ended_on, :timeliness => { :after => :started_on, :type => :date, :allow_blank => true, :if => :started_on? }
  validates :ended_on, :timeliness => { :after => :today, :type => :date, :allow_blank => true }

  def to_s
    name.to_s
  end
end
