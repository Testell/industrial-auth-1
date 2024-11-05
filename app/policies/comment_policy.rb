class CommentPolicy < ApplicationPolicy

  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    true
  end

  def new?
    true
  end

  def update?
    user == comment.author
  end

  def edit?
    user == comment.author
  end

  def destroy?
    user == comment.author
  end

end
