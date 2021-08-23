# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
      if user.nil?
        can [:read,:search], Product
      elsif user.admin?
        can :manage, :all
      elsif user.user?
        can :manage, :all
      end
  end
end
