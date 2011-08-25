class ChampionshipsController < BaseController
  def hunchables
    set_collection_ivar(end_of_association_chain.distincts.hunchables)
  end
end