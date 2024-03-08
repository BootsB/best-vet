class UsersController < ApplicationController
  def dashboard
    @user = current_user
    # @profile = current_user.profile
  end

end
