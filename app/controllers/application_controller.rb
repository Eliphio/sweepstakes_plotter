class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_user!
  rescue_from CanCan::AccessDenied, :with => :access_denied

protected
  def access_denied
    flash[:error] = "You can't access this page!"
    redirect_to root_path
  end

  def after_sign_in_path_for(resource)
    if resource.admin?
      dashboard_path
    else
      bet = Bet.hunchable.first
      if bet
        bet_path(bet)
      else
        hunchables_championships_path
      end
    end
  end
end
