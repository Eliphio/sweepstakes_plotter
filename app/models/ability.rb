class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
      cannot [:create, :destroy], [Bet, Hunch]
    elsif user.gambler?
      can :manage, [Bet, Hunch]
    else
      can [:create, :new], User
    end
  end
end
