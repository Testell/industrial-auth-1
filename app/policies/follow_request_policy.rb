class FollowRequestPolicy < ApplicationPolicy
  attr_reader :user, :follow_request

  def initialize(user, follow_request)
    @user = user
    @follow_request = follow_request
  end
  
  class Scope < Scope
    def resolve
      scope.where(sender: user).or(scope.where(recipient: user))
    end
  end

  def show?
    user == follow_request.sender || user == follow_request.recipient
  end

  def create?
    !follow_request.recipient.followers.include?(user)
  end

  def edit?
    user == follow_request.recipient
  end

  def update?
    user == follow_request.recipient
  end

  def destroy?
    user == follow_request.recipient || user == follow_request.sender
  end
end
