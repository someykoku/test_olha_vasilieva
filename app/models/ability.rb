class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
      can :access, :rails_admin
      can :manage, :dashboard
    end
    if user.doctor?
      can :finish, Appointment
    end
    if user.user?
      can :create, Appointment
    end

  end
end