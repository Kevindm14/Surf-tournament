class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
    else
      can :read, Tournament
      can :read, Category
      can :read, Participant
    end
  end
end
