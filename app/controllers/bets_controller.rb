class BetsController < BaseController
  before_filter :get_bet, :only => [:create]

  def create
    object = build_resource
    object.tap do |object|
      object.round_id = params[:round_id]
      object.user = current_user
      object.status = Bet::Status::OPEN
    end

    create!{ resource_path resource.id }
  end
protected
  def get_bet
    bet = Bet.of_user(current_user.id).of_round(params[:round_id]).first
    redirect_to resource_path bet.id if bet
  end
end