class UserPolicy
  attr_reader :current_user, :user

  def initialize(current_user, user)
    @current_user = current_user
    @user = user
  end

  def feed?
    true
  end

  def show?
    user == curent_user? ||
    !user.private? ||
    user.followers.include?(current_user)
  end
end
