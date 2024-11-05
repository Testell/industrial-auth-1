class PhotoPolicy < ApplicationPolicy
  attr_reader :user, :photo

  def initialize(user, photo)
    @user = user
    @photo = photo
  end

  def show?
    user == photo.owner || photo.owner.followers.include?(user) || !photo.owner.private?
  end

  def new?
    create?
  end

  def create?
    true 
  end

  def edit?
    update?
  end

  def update?
    user == photo.owner
  end

  def destroy?
    user == photo.owner 
  end
end
