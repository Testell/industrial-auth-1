class CommentPolicy < ApplicationPolicy

  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def show?
    user == comment.author
  end

  def create?
    true
  end

  def new?
    create?
  end

  def update?
    user == comment.author
  end

  def edit?
    update?
  end

  def destroy?
    user == comment.author
  end

  class Scope < ApplicationPolicy::Scope
   
  end
end
