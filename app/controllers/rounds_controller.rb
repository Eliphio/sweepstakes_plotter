class RoundsController < BaseController
  has_scope :of_championship, :as => :championship_id

  def hunchables
    set_collection_ivar(end_of_association_chain.distincts.hunchables)
  end
end