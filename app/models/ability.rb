class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
      canont [:create, :destroy], [Bet, Hunch]
    else
      can :manage, :[Bet, Hunch]
    end
  end
end
