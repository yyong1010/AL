module Admin
  class Ability
    include CanCan::Ability

    def initialize(user)
      return unless user.admin?

      can :read, Order
      can :read, Trade
      can :read, Proof
      can :update, Proof
      can :manage, Document
      can :manage, Member
      can :manage, Ticket
      can :manage, IdDocument
      can :manage, TwoFactor

      can :menu, Deposit
      can :manage, ::Deposits::Bank
      can :manage, ::Deposits::Satoshi
      can :manage, ::Deposits::Ether
      can :manage, ::Deposits::Scointest

      can :menu, Withdraw
      can :manage, ::Withdraws::Bank
      can :manage, ::Withdraws::Satoshi
      can :manage, ::Withdraws::Ether
      can :manage, ::Withdraws::Scointest

    end
  end
end
